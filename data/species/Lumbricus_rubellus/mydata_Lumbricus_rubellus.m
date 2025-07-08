function [data, auxData, metaData, txtData, weights] = mydata_Lumbricus_terrestris

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Lumbricus_rubellus'; 
metaData.species_en = 'Red earthworm'; 

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

data.ab = 36.5;  units.ab = 'd'; label.ab = 'age at birth';         bibkey.ab = 'ElviDomi1996';   
  temp.ab = C2K(22.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 74; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ElviDomi1996';
  temp.tp = C2K(22.5);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2601;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(22.5);    units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Lumbricus terrestris';

data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Kred2019';

data.Wwb = 0.008;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ElviDomi1996';
data.Wwp = 0.770;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'ElviDomi1996';
data.Wwi = 3.81; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Kred2019';
  comment.Wwi = 'based on length-weight of Lubricus terrestris: (15/22.5)^3*12.87';
  
data.Ri = 0.54/7;  units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'ElviDomi1996';   
  temp.Ri = C2K(22.5);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '1 cocoons per wk, 0.54 neonates per cocoon';
  
% uni-variate data

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.003	0.008
23.991	0.049
32.108	0.073
38.125	0.133
44.034	0.219
52.164	0.275
58.189	0.356
64.220	0.454
72.020	0.567
80.045	0.654
94.190	0.766];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(22.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ElviDomi1996';

%% set weights for all real data
weights = setweights(data, []);

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
metaData.links.id_CoL = '6R26H'; % Cat of Life
metaData.links.id_ITIS = '977383'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life server gives errors
metaData.links.id_Wiki = 'Lumbricus_rubellus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '15562'; % Taxonomicon
metaData.links.id_WoRMS = '994658'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumbricus_rubellus}}';
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
bibkey = 'Kred2019'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Anne Krediet}, ' ...
'year = {2019}, ' ...
'title  = {De Nederlandse Regenwormen}, ' ...
'publisher = {Jeugdbondsuitgeverij}, ' ...
'adress = {''s Gravenland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
