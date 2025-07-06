# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sinawara <sinawara@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/29 16:23:18 by sinawara          #+#    #+#              #
#    Updated: 2024/12/23 12:02:15 by sinawara         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell
SRCS =  main/main.c \
		main/main_utils1.c \
		main/main_utils2.c \
		main/main_utils3.c \
		main/main_utils4.c \
		//utils/free.c \
		utils/free_2.c \
		utils/free3.c \
		utils/errors.c \
		utils/ft_strcmp.c \
		utils/signals.c \
		utils/signal.c \
		tokens/path.c \
		tokens/quotes.c \
		tokens/tokenize.c \
		tokens/tokenize_utils.c \
		tokens/tokenize_utils2.c \
		tokens/token_type.c \
		tokens/token_type_utils.c \
		tokens/tokenize_2.0.c \
		ast/build_ast.c \
		ast/build_ast_utils.c \
		ast/build_command_node.c \
		ast/arg_to_cmd.c \
		ast/handle_redir.c \
		ast/execute_ast.c \
		ast/execute_ast_utils.c \
		exec/error_pipe.c \
		exec/exec_simple_command.c \
		builtin/echo.c \
		builtin/echo_utils1.c \
		builtin/echo_utils2.c \
		builtin/echo_utils3.c \
		builtin/pwd.c \
		builtin/export.c \
		builtin/unset.c \
		builtin/env.c \
		builtin/exit.c \
		builtin/cd.c \
		builtin/cd_utils.c \
		builtin/export_utils.c \
		builtin/export_utils_more.c \
		builtin/export_utils3.c \
		exec/execute_cmd_extern.c \
		exec/redirection_setup.c \
		exec/heredoc.c \
		exec/heredoc_util.c \
		exec/heredoc_util2.c \
		exec/exit_status.c
CC = gcc -g -O0
CCFLAG = -Wall -Wextra -Werror
LIB = -C ./libft/

SUCCESS_COLOR = \033[32m

OBJ_DIR = obj

OBJECT = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

D_SRCS = ./src/

# ASCII logo defined as a shell command
WHITE   = \033[37m
RED     = \033[31m
BURGUNDY = \033[38;5;88m
BLUE    = \033[34m
GREEN   = \033[32m
MINECRAFT_GREEN = \033[38;5;70m
YELLOW  = \033[33m
PINK    = \033[35m
CYAN    = \033[36m
ORANGE  = \033[38;5;214m
PURPLE  = \033[38;5;93m

LOGO = printf "\n\
$(MINECRAFT_GREEN)███╗   ███╗██╗███╗   ██╗██╗███████╗██╗  ██╗███████╗██╗     ██╗     $(MINECRAFT_GREEN)\n\
$(MINECRAFT_GREEN)████╗ ████║██║████╗  ██║██║██╔════╝██║  ██║██╔════╝██║     ██║     $(MINECRAFT_GREEN)\n\
$(MINECRAFT_GREEN)██╔████╔██║██║██╔██╗ ██║██║███████╗███████║█████╗  ██║     ██║     $(MINECRAFT_GREEN)\n\
$(MINECRAFT_GREEN)██║╚██╔╝██║██║██║╚██╗██║██║╚════██║██╔══██║██╔══╝  ██║     ██║     $(MINECRAFT_GREEN)\n\
$(MINECRAFT_GREEN)██║ ╚═╝ ██║██║██║ ╚████║██║███████║██║  ██║███████╗███████╗███████╗$(MINECRAFT_GREEN)\n\
$(MINECRAFT_GREEN)╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝$(MINECRAFT_GREEN)\n"

all :  $(NAME)

$(OBJ_DIR)/%.o: $(D_SRCS)%.c | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	@$(CC) $(CCFLAG) -I./libft -I/includes -o $@ -c $<

# Create obj directory if it doesn't exist
$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(NAME) : $(OBJECT)
	@$(LOGO)
	@make $(LIB)
	@$(CC) $(CCFLAG) -o $(NAME) $(OBJECT) -L./libft -lft -lreadline -lhistory
	@echo "$(SUCCESS_COLOR)$(NAME) - Compiled with Success"

clean :
	@make clean $(LIB)
	@echo "$(SUCCESS_COLOR)$(NAME) - Cleaned with Success"
	@/bin/rm -rf $(OBJ_DIR)

fclean : clean
	@make fclean $(LIB)
	@rm -rf ./$(NAME)
	@echo "$(SUCCESS_COLOR)$(NAME) - FCleaned with Success"

re : fclean all

.PHONY: all clean fclean re bonus
