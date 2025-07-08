function [data, auxData, metaData, txtData, weights] = mydata_Biomphalaria_alexandrina

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Biomphalaria_alexandrina'; 
metaData.species_en = 'Freshwater snail'; 

metaData.ecoCode.climate = {'BSk', 'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ni_T'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 30]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.09; units.Lb  = 'cm';  label.Lb  = 'shell diameter at birth';   bibkey.Lb  = 'ElEmMads1982';
data.Lp  = 0.65; units.Lp  = 'cm';  label.Lp  = 'shell diameter at puberty'; bibkey.Lp  = 'ElEmMads1982';
data.Li  = 1.75; units.Li  = 'cm';  label.Li  = 'ultimate shell diameter';   bibkey.Li  = 'guess';
  comment.Li = 'value for Biomphalaria_glabrata';

data.Wwi  = 2.35; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'value for Biomphalaria_glabrata';

data.N26  = 66.5;   units.N26  = '#'; label.N26  = 'number of eggs at 121 d since birth';     bibkey.N26  = 'ElEmMads1982';   
  temp.N26 = C2K(26);  units.temp.N26 = 'K'; label.temp.N26 = 'temperature';
data.N18  = 41.3;   units.N18  = '#'; label.N18  = 'number of eggs at 121 d since birth';     bibkey.N18  = 'ElEmMads1982';   
  temp.N18 = C2K(18);  units.temp.N18 = 'K'; label.temp.N18 = 'temperature';
 
% uni-variate data
% time - length
data.tL26 = [ ... % age (d), shell diameter (cm)
    28 0.362
    56 0.668
    84 0.794
   112 0.884
];
units.tL26   = {'d', 'cm'};  label.tL26 = {'time since birth', 'shell diameter', '26 C'};  
temp.tL26    = C2K(26);  units.temp.tL26 = 'K'; label.temp.tL26 = 'temperature';
bibkey.tL26 = 'ElEmMads1982';
%
data.tL18 = [ ... % age (d), shell diameter (cm)
    28 0.414
    56 0.617
    84 0.748
   112 0.854
];
units.tL18   = {'d', 'cm'};  label.tL18 = {'time since birth', 'shell diameter', '18 C'};  
temp.tL18    = C2K(18);  units.temp.tL18 = 'K'; label.temp.tL18 = 'temperature';
bibkey.tL18 = 'ElEmMads1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tL26 = 8 * weights.tL26;
weights.tL18 = 8 * weights.tL18;

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
set1 = {'tL26','tL18'}; subtitle1 = {'Data for 26, 18 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Simultaneous hermaprodite; cross-fertilizes with Biomphalaria_glabrata';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LV2F'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4805243'; % Ency of Life
metaData.links.id_Wiki = 'Biomphalaria_alexandrina'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686741'; % Taxonomicon
metaData.links.id_WoRMS = '1060864'; % WoRMS
metaData.links.id_molluscabase = '1060864'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Biomphalaria_alexandrina}}';
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
bibkey = 'ElEmMads1982'; type = 'Article'; bib = [ ... 
'author = {M. A . El-Emam and H. Madsen}, ' ... 
'title = {The effect of temperature, darkness, starvation and various food types on growth, survival and reproduction of \emph{Helisoma duryi}, \emph{Biomphalaria alexandrina} and \emph{Bulinus truncatus} ({G}astropoda : {P}lanorbidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {88}, ' ...
'year = {1982}, ' ...
'pages = {265-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
