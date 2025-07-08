function [data, auxData, metaData, txtData, weights] = mydata_Bulinus_tropicus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Bulinidae';
metaData.species    = 'Bulinus_tropicus'; 
metaData.species_en = 'Freshwater snail'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 01]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.11; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'ElEmMads1982';
  comment.Lb = 'based on Bulinus truncatus';
data.Lp  = 0.4; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'guess';
data.Li  = 0.9; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'EoL';

data.Ri  = 20/7;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'ChauMorg1987';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), shell height (cm)
0.000	0.473
14.022	0.505
28.081	0.590
41.334	0.752
48.662	0.811];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChauMorg1987';
comment.tL = '3 snails/ 500 ml';
%
data.tL1 = [ ... % age (d), shell height (cm)
0.000	0.479
14.325	0.514
27.758	0.623
42.004	0.641
48.578	0.674];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'shell height'};  
temp.tL1    = C2K(27);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'ChauMorg1987';
comment.tL1 = '24 snails/ 500 ml';

% time - weight
data.tWw = [ ... % age (d), wet weight (mg)
0.000	16.111
7.001	21.222
13.846	33.667
20.992	48.778
28.573	75.667
34.818	82.778
42.117	97.222
48.970	105.667];
data.tWw(:,2) = data.tWw(:,2)/ 1000; % convert mg to g
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(27);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ChauMorg1987';
comment.tWw = '3 snails/ 500 ml';
%
data.tWw1 = [ ... % age (d), wet weight (mg)
0.000	16.556
7.001	20.778
14.157	30.778
21.464	41.000
28.466	51.444
35.170	58.111
42.025	65.667
49.349	67.444];
data.tWw1(:,2) = data.tWw1(:,2)/ 1000; % convert mg to g
units.tWw1   = {'d', 'g'};  label.tWw1 = {'time since birth', 'wet weight'};  
temp.tWw1    = C2K(27);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
bibkey.tWw1 = 'ChauMorg1987';
comment.tWw1 = '24 snails/ 500 ml';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tWw = 3 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for 3, 24 snailes per 500 ml C'};
set2 = {'tWw','tWw1'}; subtitle2 = {'Data for 3, 24 snailes per 500 ml C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NTPG'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4939637'; % Ency of Life
metaData.links.id_Wiki = 'Bulinus_tropicus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1678435'; % Taxonomicon
metaData.links.id_WoRMS = '1058684'; % WoRMS
metaData.links.id_molluscabase = '1058684'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bulinus_tropicus}}';
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
bibkey = 'ChauMorg1987'; type = 'Article'; bib = [ ... 
'author = {Asghar M. Chaudhry and Elfed Morgan}, ' ... 
'title = {FACTORS AFFECTING THE GROWTH AND FECUNDITY OF \emph{Bulinus tropicus} ({K}RAUSS) ({G}ASTROPODA)}, ' ...
'journal = {Moll. Stud. (), , .}, ' ...
'volume = {53}, ' ...
'year = {1987}, ' ...
'pages = {52-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ElEmMads1982'; type = 'Article'; bib = [ ... 
'author = {M. A . El-Emam and H. Madsen}, ' ... 
'title = {The effect of temperature, darkness, starvation and various food types on growth, survival and reproduction of \emph{Helisoma duryi}, \emph{Biomphalaria alexandrina} and \emph{Bulinus truncatus} ({G}astropoda : {P}lanorbidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {88}, ' ...
'year = {1982}, ' ...
'pages = {265-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4939637}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

