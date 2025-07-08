function [data, auxData, metaData, txtData, weights] = mydata_Stichopus_japonicus

%% set metadata
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Holothuroidea'; 
metaData.order      = 'Synallactida'; 
metaData.family     = 'Stichopodidae';
metaData.species    = 'Aspostichopus_japonicus'; 
metaData.species_en = 'Japanese sea cucumber';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};
metaData.data_1     = {'t-L_f'; 't-Ww_f'; 'L-Ww'};

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Jeffrey Ren'};                            
metaData.date_subm = [2018 11 19];                            
metaData.email    = {'jeffrey.ren@niwa.co.nz'};                  
metaData.address  = {'National Institute of Water and Atmospheric Research, PO Box 8602, Christchurch 8440, New Zealand'}; 

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 12 05]; 


%% set data
% zero-variate data;

data.ab = 10;   units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'Qiu2013'; bibkey.ab = 'Ito1998'; 
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 90;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Qiu2013';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am =7*365 ;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Sun2013';     
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2; units.Lb  = 'cm';  label.Lb  = 'total length at birth';       bibkey.Lb  = 'Qiu2013';
data.Lp  = 2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';       bibkey.Lp  = 'Qiu2013';
data.Li  = 36.7; units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'Hamano1989';

data.Wwb = 1e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Qiu2013'; 
data.Wwp = 0.2; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'Qiu2013'; 
data.Wwi = 1200; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'Qiu2013'; 

% uni-variate data

% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.5	 4.5
1	 7.5
1	  7.5
2    15
3	 17
4	 21
5	 23];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'length'}; 
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'Chen2003','Sun2013','Qiu2015'};
comment.tL = 'combined data from all these sources';
%
data.tL1 = [ ... % time since birth (yr), length (cm)
0.25  2.3
1	  8.7
2	 10.2
2.5	10.5
3	 13.2
4	 15.9
5	 18.3]; 
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
units.tL1 = {'d', 'cm'};     label.tL1 = {'time since birth', 'length'}; 
temp.tL1 = C2K(18);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Hamano1989';

% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.5	  9
1	 31.56
1	 32.4
2	259.2
3	377.3
4	711.2
5	934.4];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'Chen2003','Sun2013','Qiu2015'};
comment.tW = 'combined data from all these sources';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.25  0.9
1	 23
2	 81
2.5	132.6
3	178.3
4	310.8
5	471.8];  % g, wet weight at f and T
data.tW1(:,1) = data.tW1(:,1) * 365; % convert yr to d 
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(18);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Hamano1989';

% L-W data (create L-W based on length-weight relationship)
data.LW=zeros(25:2);
data.LW(:,1)=1:25;
data.LW(:,2)=0.0785*data.LW(:,1).^2.964;
units.LW   = {'cm', 'g'};  label.LW = {'length', 'wet weight'};  
bibkey.LW = {'Chen2003','Sun2013','Qiu2015','Hamano1989'};
comment.LW = 'combined data from all these sources';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 0.1 * weights.Li;  % length is highly variable for this species
weights.tp = 0 * weights.tp;    % neglect ap, due to inconsistency of (ap, Lp) with tL 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Chen2003,Sun2013, Qiu2015 versus Hamano1989'};
set2 = {'tW','tW1'}; subtitle2 = {'Data from Chen2003,Sun2013, Qiu2015 versus Hamano1989'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Data point tp is neclected due to inconsistency of (tp,Wwp) with tW data; Li is given less weight, due to uncertainty in data';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'FVH9'; % Cat of Life
metaData.links.id_ITIS = '656053'; % ITIS
metaData.links.id_EoL = '399016'; % Ency of Life
metaData.links.id_Wiki = 'Aspostichopus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Aspostichopus_japonicus'; % ADW
metaData.links.id_Taxo = '41315'; % Taxonomicon
metaData.links.id_WoRMS = '241776'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Apostichopus_japonicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chen2003'; type = 'Article'; bib = [ ... 
'author = {Chen, J.}, ' ... 
'year = {2003}, ' ...
'title = {Review of sea cucumber farming and sea ranching practices in {C}hina}, ' ...
'journal = {SPC Beche-de-mer Inf Bull}, ' ...
'volume = {18}, ' ...
'pages = {18--23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Qiu2013'; type = 'phdthesis'; bib = [ ...
'author = {Qiu T}, ' ...
'year = {2013}, ' ...
'title  = {Research and application of key technical principles of sea cucumber (\emph{Apostichopus japonicus} {S}elenka) ecological seed breeding}, ' ...
'school = {University of Chinese Academy of Sciences}, ' ...
'howpublished = {\url{http://www.ucas.ac.cn/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Qiu2015'; type = 'Book'; bib = [ ...
'author = {Qiu, T. and Zhang, T and Hamel, J.F. and Mercier, A.}, ' ...
'year = {2015}, ' ...
'title  = {Development, settlement and post-settlement growth}, ' ...
'publisher = {Academic Press, London}, ' ...
'pages = {111--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sun2013'; type = 'Misc'; bib = [ ... 
'author = {Sun, G.}, ' ... 
'year = {2010}, ' ...
'title = {Sea cucumber \emph{Apostichopus japonicus} de {G}eer}, ' ...
'howpublished = {\url{/www.docin.com/p-798281216.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ito1998'; type = 'Article'; bib = [ ... 
'author = {Ito S, Kitamura H}, ' ... 
'year = {1998}, ' ...
'title = {Technical development in seed production of the {J}apanese sea cucumber, \emph{Stichopus japonicus}}, ' ...
'journal = {Suisanzoshoku}, ' ...
'volume = {37}, ' ...
'pages = {179-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hamano1989'; type = 'Article'; bib = [ ... 
'author = {Hamano, T. and Amio, M. and Hayashi, K.}, ' ... 
'year = {1989}, ' ...
'title = {Population dynamics of \emph{Apostichopus japonicus} de {G}eer {S}elenka ({H}olothuroidea, {E}chinodermata) in an intertidal zone and on the adjacent subtidal bottom with artificial reefs for {S}argassum}, ' ...
'journal = {Suisanzoshoku}, ' ...
'volume = {37}, ' ...
'pages = {179-186}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

