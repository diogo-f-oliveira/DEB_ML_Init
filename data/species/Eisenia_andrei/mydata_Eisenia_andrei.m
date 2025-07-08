function [data, auxData, metaData, txtData, weights] = mydata_Eisenia_andrei

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Eisenia_andrei'; 
metaData.species_en = 'Earthworm'; 

metaData.ecoCode.climate = {'B', 'C'};
metaData.ecoCode.ecozone = {'TP', 'TA', 'TN', 'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 02 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 02 27]; 

%% set data
% zero-variate data

data.ab = 21.7;  units.ab = 'd'; label.ab = 'age at birth';         bibkey.ab = 'ElviDomi1996';   
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 36; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DomiEdwa1997';
  temp.tp = C2K(22.5);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2601;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(22.5);    units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Lumbricus terrestris';

data.Li  = 13;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Kred2019';

data.Wwb = 0.02;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DomiEdwa1997';
data.Wwp = 0.772;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'DomiEdwa1997';
data.Wwi = 0.93; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'DomiEdwa1997';

data.Ri = 2.7*186/13/40;  units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'ElviDomi1996';   
  temp.Ri = C2K(22.5);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '1 cocoons per wk, based 2.7 neonates per cocoon as for E. fetida; 186 cocoons by 40 works in 13 d';

% uni-variate data

% time-weight
data.tW = [ ... % time (d), wet weight (g)
0.000	0.018
3.841	0.150
7.936	0.189
11.930	0.223
15.914	0.281
19.825	0.272
24.134	0.291
28.001	0.382
31.970	0.473
35.841	0.553
40.043	0.582
43.936	0.613];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DomiEdwa1997';
comment.tW = 'in  pig manure; soil moisture 85 percent, which is optimal';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '38W42'; % Cat of Life
metaData.links.id_ITIS = '976613'; % ITIS
metaData.links.id_EoL = '3126936'; % Ency of Life 
metaData.links.id_Wiki = 'Eisenia_andrei'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '15556'; % Taxonomicon
metaData.links.id_WoRMS = '1041026'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eisenia_andrei}}';
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
bibkey = 'ElviDomi1996'; type = 'Article'; bib = [ ... 
'author = {C. Elvira and J. Dominguez and S. Mato}, ' ... 
'year = {1996}, ' ...
'title = {The growth and reproduction of \emph{Lumbricus rubellus} and \emph{Dendrobaena rubida} in cow manure. Mixed cultures with \emph{Eisenia andrei}}, ' ...
'journal = {Applied Soil Ecology}, ' ...
'volume = {5}, ' ...
'pages = {97-103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DomiEdwa1997'; type = 'Article'; bib = [ ... 
'author = {J. Dom\''{i}nguez and C. A. Edwards}, ' ... 
'year = {1997}, ' ...
'title = {Effects of stocking rate and moisture content on the growth and maturation of \emph{Eisenia andrei} ({O}ligochaeta) in pig manure}, ' ...
'journal = {Soil Biology and Biochemistry}, ' ...
'volume = {29(3-4)}, ' ...
'pages = {743-746}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kred2019'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Anne Krediet}, ' ...
'year = {2019}, ' ...
'title  = {De Nederlandse Regenwormen}, ' ...
'publisher = {Jeugdbondsuitgeverij}, ' ...
'adress = {''s Gravenland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
