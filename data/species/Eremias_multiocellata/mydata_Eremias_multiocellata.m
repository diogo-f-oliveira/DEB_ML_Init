function [data, auxData, metaData, txtData, weights] = mydata_Acanthodactylus_erythrurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Eremias_multiocellata'; 
metaData.species_en = 'Multi-ocellated racerunner'; 

metaData.ecoCode.climate = {'BSh', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 22];

%% set data
% zero-variate data

data.am = 3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.51;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'LiQu2011';
data.Wwp = 15;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
  comment.Wwp = 'based on same relative weight, compared to Lacerta agilis: 27.5*6.5/11.9';
data.Wwi = 27.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'LiQu2011';

data.Ri  = 5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'LiQu2011';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 5';

% univariate data
% time-weight data
data.tWw = [ ... % time since birth (d), wet weight (g)
0.000	0.554
13.671	0.961
28.253	1.206
43.975	1.493
58.785	1.832
74.051	2.098
89.316	2.301];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw   = C2K(25);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'LiQu2011';
comment.tWw = 'Data from Dalateqi (Mongolia)';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'this species is viviparous';
metaData.bibkey.F1 = 'LiQu2011'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GDY4'; % Cat of Life
metaData.links.id_ITIS = '1155265'; % ITIS
metaData.links.id_EoL = '794750'; % Ency of Life
metaData.links.id_Wiki = 'Eremias_multiocellata'; % Wikipedia
metaData.links.id_ADW = 'Eremias_multiocellata'; % ADW
metaData.links.id_Taxo = '49561'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eremias&species=multiocellata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eremias_multiocellata}}';
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
bibkey = 'LiQu2011'; type = 'Article'; bib = [ ... 
'doi = {10.2108/zsj.28.332}, ' ...
'author = {Hong Li and Yan-Fu Qu and Guo-Hua Ding and Xiang Ji}, ' ... 
'year = {2011}, ' ...
'volume = {28}, ' ...
'pages = {332-338}, ' ...
'title = {Life-history Variation with Respect to Experienced Thermal Environments in the Lizard, \emph{Eremias multiocellata} ({L}acertidae)}, ' ...
'journal = {Zoological Science'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Acanthodactylus&species=erythrurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

