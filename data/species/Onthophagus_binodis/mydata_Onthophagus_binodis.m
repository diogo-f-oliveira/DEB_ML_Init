function [data, auxData, metaData, txtData, weights] = mydata_Onthophagus_binodis 

% http://www.debtheory.org/wiki/index.php?title=Mydata_file#Metadata

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Coleoptera'; 
metaData.family     = 'Scarabaeidae';
metaData.species    = 'Onthophagus_binodis'; 
metaData.species_en = 'Humpbacked dung beetle';

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjE', 'eiE'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011 http://www.debtheory.org/wiki/index.php?title=Completeness

metaData.author   = {'Alva Curtsdotter'};    
metaData.date_subm = [2019 03 27];              
metaData.email    = {'alva.curtsdotter@gmail.com'};            
metaData.address  = {'University of New England, Armidale NSW 2351, Australia'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 04 18]; 

%% set data
% zero-variate data
data.ab = 25;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'FloaWats2012';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for for O. taurus';
data.tj = 33;    units.tj = 'd';    label.tj = 'time since birth at pupation'; bibkey.tj = 'HuntSimm2002';
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'value for O. taurus';
data.am = 15;    units.am = 'd';    label.am = 'life span of imago';           bibkey.am = 'HuntSimm2002';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for O. taurus';
data.t1 = 5;    units.t1 = 'd';     label.t1 = 'duration of instar 1';         bibkey.t1 = 'Mack2015';   
  temp.t1 = C2K(28);  units.temp.t1 = 'K'; label.temp.t1 = 'temperature'; 
data.t2 = 10;    units.t2 = 'd';     label.t2 = 'duration of instar 2';         bibkey.t2 = 'Mack2015';   
  temp.t2 = C2K(28);  units.temp.t2 = 'K'; label.temp.t2 = 'temperature'; 
data.t3 = 10;    units.t3 = 'd';     label.t3 = 'duration of instar 3';         bibkey.t3 = 'Mack2015';   
  temp.t3 = C2K(28);  units.temp.t3 = 'K'; label.temp.t3 = 'temperature'; 
data.t4 = 8;    units.t4 = 'd';     label.t4 = 'duration of instar 4';         bibkey.t4 = 'Mack2015';   
  temp.t4 = C2K(28);  units.temp.t4 = 'K'; label.temp.t4 = 'temperature'; 
 
% data.Lb  = ;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = '';  
% data.Lp  = ;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = ''; 
% data.Li  = ;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = '';

data.L1 = 0.246;  units.L1 = 'cm'; label.L1 = 'maximum length head capsule of instar 1'; bibkey.L1 = 'Mack2015';
data.L2 = 0.263;  units.L2 = 'cm'; label.L2 = 'maximum length head capsule of instar 2'; bibkey.L2 = 'Mack2015';
data.L3 = 0.367;  units.L3 = 'cm'; label.L3 = 'maximum length head capsule of instnr 3'; bibkey.L3 = 'Mack2015';
data.L4 = 0.491;  units.L4 = 'cm'; label.L4 = 'maximum length head capsule of instar 4'; bibkey.L4 = 'Mack2015';

% from the ARC proposal; very approximate. but we have specimens in the freezer we can measure so it'll be data that we have
% data.Lm = 11?; units.Lm = 'mm'; label.Lm = 'maximum length of imago';  bibkey.Lm  = '???'; 

data.Ww1 = 7.37e-2; units.Ww1 = 'g'; label.Ww1 = 'maximum wet weight of instar 1';      bibkey.Ww1 = 'Mack2015';
data.Ww2 = 1.10e-1; units.Ww2 = 'g'; label.Ww2 = 'maximum wet weight of instar 2';      bibkey.Ww2 = 'Mack2015';
data.Ww3 = 5.18e-1; units.Ww3 = 'g'; label.Ww3 = 'maximum wet weight of instar 3';      bibkey.Ww3 = 'Mack2015';
data.Ww4 = 1.512;   units.Ww4 = 'g'; label.Ww4 = 'maximum wet weight of instar 4';      bibkey.Ww4 = 'Mack2015';

data.Ni  = 26; units.Ni  = '#';  label.Ni  = 'life time reprod output for  O. taurus';   bibkey.Ni  = 'HuntSimm2002';   
  temp.Ni = C2K(28); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time - wet weights of larva
data.tW =  [ ... % time since birth (d), wet weight (mg)
4.0000000	32.6
4.0000001	33.1
4.0000002	35.6
4.0000003	63
4.0000004	54.5
4.0000005	73.7
4.0000006	29.9
4.0000007	31.5
4.0000008	26.1
4.0000009	26.4
4.000001	29.4
4.0000011	22.1
7.0000000	110
7.0000001	91.7
7.0000002	83.6
7.0000003	88.8
7.0000004	75.5
7.0000005	55.8
7.0000006	69.5
7.0000007	48.4
7.0000008	56.1
7.0000009	31.2
7.000001	27
7.0000011	24.1
15.0000000	272
15.0000001	518
15.0000002	171
15.0000003	383
15.0000004	408
15.0000005	402
15.0000006	235
15.0000007	238
15.0000008	239
15.0000009	312
15.000001	297
15.0000011	309
15.0000012	289
15.0000013	230
25.0000000	1164
25.0000001	1255
25.0000002	1072
25.0000003	1170
25.0000004	1041
25.0000005	1149
25.0000006	1156
25.0000007	1512
25.0000008	1050
25.0000009	1256
25.000001	741
25.0000011	506
25.0000012	477];
data.tW(:,2) = data.tW(:,2)/ 1e3; % convert mg to g
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Mack2015';
  
%  head capsule length of larva  - weight
data.LW =  [ ... % head capsule length of larva (mm), weight (mg), 
2.46	32.6
2.45	33.1
2.44	35.6
2.41	63
2.35	54.5
2.27	73.7
2.12	29.9
2.09	31.5
2.06	26.1
1.97	26.4
1.97	29.4
1.80	22.1
2.63	110
2.62	91.7
2.51	83.6
2.49	88.8
2.48	75.5
2.40	55.8
2.40	69.5
2.38	48.4
2.37	56.1
2.36	31.2
2.26	27
1.79	24.1
3.67	272
3.60	518
3.56	171
3.54	383
3.52	408
3.51	402
3.48	235
3.48	238
3.41	239
3.40	312
3.39	297
3.36	309
3.28	289
2.55	230
4.91	1164
4.86	1255
4.84	1072
4.83	1170
4.81	1041
4.81	1149
4.80	1156
4.80	1512
4.78	1050
4.78	1256
4.65	741
4.48	506
3.31	477];
data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
data.LW(:,2) = data.LW(:,2)/ 1e3; % convert mg to g
units.LW  = {'cm', 'g'}; label.LW = {'head capsule length of larva', 'wet weight'};  
bibkey.LW = 'Mack2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Ni = 10 * weights.Ni;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
% D1 = '';
% D2 = '';     
% metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7XMGN'; % Cat of Life
metaData.links.id_ITIS = '187518'; % ITIS
metaData.links.id_EoL = '142738'; % Ency of Life
metaData.links.id_Wiki = 'Onthophagus_binodis'; % Wikipedia
metaData.links.id_ADW = 'Onthophagus_binodis'; % ADW
metaData.links.id_Taxo = '495382'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Onthophagus}}';
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
bibkey = 'FloaWats2012'; type = 'Article'; bib = [ ... 
'author = {Floate, K. D. and Watson, D. W. and Coghlin, P. and Olfert, O.}, ' ...
'year = {2012}, ' ...
'title = {Degree-day models for development of the dung beetles \emph{Onthophagus nuchicornis}, \emph{O. taurus}, and \emph{Digitonthophagus gazella} ({C}oleoptera: {S}carabaeidae), and the likelihood of \emph{O. taurus} establishment in southern {A}lberta, {C}anada}, ' ...
'journal = {The Canadian Entomologist}, ' ...
'volume = {147}, ' ...
'pages = {617--627}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mack2015'; type = 'PhDthesis'; bib = [ ... 
'author = {Mackenzie, S.}, ' ...
'year = {2015}, ' ...
'title = {Impacts of macrocyclic lactones on dung beetle larval performance}, ' ...
'school = {University of New Engand}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuntSimm2002'; type = 'Article'; bib = [ ... 
'author = {J. Hunt and L. W. Simmons and J. S. Kotiaho}, '...
'title = {A cost of maternal care in the dung beetle \emph{Onthophagus taurus}?}, '...
'year = {2002}, ' ...
'journal = {J. Evol. Biol.}, '...
'volume = {15}, '...
'pages = {57--64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

