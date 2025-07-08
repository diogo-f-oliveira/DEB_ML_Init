function [data, auxData, metaData, txtData, weights] = mydata_Moina_micrura
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Moinidae';
metaData.species    = 'Moina_micrura'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH','TN','TP'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 04]; 

%% set data
% zero-variate data

data.ab = 24.29/24;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'SipauBach2002';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on inter-clutch time of 33 h';
data.tp = 1.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BonoPaga1991';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'BonoPaga1991';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0500; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SipauBach2002';
data.Lp  = 0.0625; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SipauBach2002';
data.Li  = 0.0770;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SipauBach2002';

data.Wdb = 0.48e-6;   units.Wdb = 'g';   label.Wdb = 'dry weight birth';     bibkey.Wdb = 'BonoPaga1991';
data.Wdp = 1.40e-6;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';  bibkey.Wdp = 'BonoPaga1991';
data.Wdi = 3.75e-6;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'SipauBach2002';
  
data.Ri  = 8.63/4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'SipauBach2002';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8.63 young per life time, 4 d adult';
 
% uni-variate data

% time-dry weight
data.tWd = [ ... % time since birth (d), dry weight (mug)
0.004	0.482
0.226	0.605
0.985	1.329
1.494	1.542
2.532	2.148
3.544	2.282
4.510	2.691
5.495	3.224];
units.tWd   = {'d', 'mug'};  label.tWd = {'time since birth', 'dry weight'};  
temp.tWd    = C2K(25);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'BonoPaga1991';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0 * weights.Lb;
weights.Lp = 0 * weights.Lp;
weights.Li = 0 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73MF2'; % Cat of Life
metaData.links.id_ITIS = '84165'; % ITIS
metaData.links.id_EoL = '1020228'; % Ency of Life
metaData.links.id_Wiki = 'Moina'; % Wikipedia
metaData.links.id_ADW = 'Moina_micrura'; % ADW
metaData.links.id_Taxo = '156186'; % Taxonomicon
metaData.links.id_WoRMS = '1303079'; % WoRMS


%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Ceriodaphnia~pulchella.pdf}}';
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
bibkey = 'BonoPaga1991'; type = 'Article'; bib = [ ... 
'author = {C. A. Bonou and M. Pagano and L. Saint-Jean}, ' ... 
'year = {1991}, ' ...
'title = {D\''{e}veloppement et croissance en poids de \emph{Moina (cf) micrura} et de \emph{Mesocyclops ogunnus} dans un milieu saum\^{a}tre tropical: les \''{e}tangs de pisciculture de {L}ayo ({C}\^{o}te d''{I}voire}, ' ...
'journal = {Rev. Hydrobiol. trop.}, ' ...
'volume = {24(4)}, ' ...
'pages = {287-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SipauBach2002'; type = 'Article'; bib = [ ... 
'author = {Sipa\''{u}ba-Tavares, L. H. and Bachion, M. A.}, ' ... 
'year = {2002}, ' ...
'title = {POPULATION GROWTH AND DEVELOPMENT OF TWO SPECIES OF {C}LADOCERA, \emph{Moina micrura} AND \emph{Diaphanosoma birgei}, IN LABORATORY}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'volume = {62(4A)}, ' ...
'pages = {701-711}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

