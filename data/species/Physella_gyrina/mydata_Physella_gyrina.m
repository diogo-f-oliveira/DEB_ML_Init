function [data, auxData, metaData, txtData, weights] = mydata_Physella_gyrina

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Physidae';
metaData.species    = 'Physella_gyrina'; 
metaData.species_en = 'Tadpole physa'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 25]; 

%% set data
% zero-variate data

data.ab = 10;  units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'DeWi1955';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 22*30.5;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'DeWi1955';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'data from laboratory; in the field 13 months';

data.Lb  = 0.075; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'DeWi1954';
data.Lp  = 0.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'DeWi1955';
data.Li  = 1.40; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'DeWi1954';

data.Wdi = 0.07; units.Wdi = 'g';  label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';
  comment.Wdi = 'based on size-corrected value for Lymnaea stagnalis, with extra correction for shape difference, excluding shell: 0.699*(1.4/3)^3';
 
data.Ri  = 190/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (wk), shell length (cm)
 0 0.075
 1 0.083
 2 0.195
 3 0.371
 4 0.654
 5 0.875
 6 1.017
 8 1.204
10 1.225
12 1.255
14 1.254
16 1.263
20 1.279
25 1.283
30 1.292
52 1.363];
data.tL(:,1) = data.tL(:,1) * 7;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DeWi1954';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HGZH'; % Cat of Life
metaData.links.id_ITIS = '76735'; % ITIS
metaData.links.id_EoL = '452939'; % Ency of Life
metaData.links.id_Wiki = 'Physella_gyrina'; % Wikipedia
metaData.links.id_ADW = 'Physella_gyrina'; % ADW
metaData.links.id_Taxo = '909327'; % Taxonomicon
metaData.links.id_WoRMS = '1001485'; % WoRMS
metaData.links.id_molluscabase = '1001485'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Physella_gyrina}}';
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
bibkey = 'DeWi1954'; type = 'Article'; bib = [ ... 
'author = {Robert M. DeWitt}, ' ... 
'year = {1955}, ' ...
'title = {Reproduction, Embryonic Development, and Growth in the Pond Snail, \emph{Physa gyrina} {S}ay}, ' ...
'journal = {Transactions of the American Microscopical Society}, ' ...
'volume = {73(2)}, ' ...
'pages = {124-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeWi1955'; type = 'Article'; bib = [ ... 
'author = {Robert M. DeWitt}, ' ... 
'year = {1955}, ' ...
'title = {The Ecology and Life History of the Pond Snail \emph{Physa gyrina}}, ' ...
'journal = {Ecology}, ' ...
'volume = {36(1)}, ' ...
'pages = {40-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
