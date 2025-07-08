function [data, auxData, metaData, txtData, weights] = mydata_Saimiri_sciureus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cebidae';
metaData.species    = 'Saimiri_sciureus'; 
metaData.species_en = 'Common squirrel monkey'; 
metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(38.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 12 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 24]; 

%% set data
% zero-variate data

data.tg = 161;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 177;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1003;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 30.2*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 29.5;  units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Emmo1990';

data.Wwb = 107;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 403;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 925;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
data.tW = [ ... % time since birth (d), body weight (g)
0.146	108.907
28.863	195.221
61.290	267.395
92.471	336.740
122.387	390.525
152.301	442.895
183.409	458.493
213.299	492.477
248.175	536.367
275.545	546.303
306.690	588.774
335.322	612.855
367.674	628.455
396.293	642.636
428.656	666.722
457.291	692.218
487.140	696.499
519.499	717.756
549.343	717.795
580.461	740.465
609.063	741.916
640.154	744.785
673.757	766.044
704.859	777.399
733.494	802.894
765.874	839.710
791.999	848.230
824.333	851.100
857.961	890.746
885.329	899.267
917.637	882.337
946.245	888.031
977.345	897.972
1008.442	905.083
1039.520	898.052
1069.383	912.234
1097.998	923.586];
units.tW   = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FranGing2009';
   
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-6;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '4TZK2'; % Cat of Life
metaData.links.id_ITIS = '180095'; % ITIS
metaData.links.id_EoL = '327956'; % Ency of Life
metaData.links.id_Wiki = 'Saimiri_sciureus'; % Wikipedia
metaData.links.id_ADW = 'Saimiri_sciureus'; % ADW
metaData.links.id_Taxo = '65765'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100291'; % MSW3
metaData.links.id_AnAge = 'Saimiri_sciureus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saimiri_sciureus}}';
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
bibkey = 'Emmo1990'; type = 'Book'; bib = [ ... 
'author = {Emmons, L. H.}, ' ... 
'year = {1990}, ' ...
'title = {Neotropical rainforest mammals; a field guide}, ' ...
'publisher = {Univ of Chicago Press}, ' ...
'address = {Chicago}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FranGing2009'; type = 'Article'; bib = [ ... 
'author = {Franzen, J. L. and Gingerich, P. D. and Habersetzer, J. and Hurum, J.H. and von Koenigswald, W. and B. H. Smith}, ' ... 
'year = {2009}, ' ...
'title = {Complete Primate Skeleton from the Middle Eocene of {M}essel in {G}ermany: Morphology and Paleobiology}, ' ...
'journal = {PLOS ONE}, ' ...
'volume = {4}, ' ...
'number = {5}, ' ...
'doi = {10.1371/journal.pone.0005723}, '...
'pages = {e5723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lind2002'; type = 'Article'; bib = [ ... 
'author = {Lindenfors P.}, ' ... 
'year = {2002}, ' ...
'title = {Sexually antagonistic selection on primate size}, ' ...
'journal = {Journal of Evolutionary Biology}, ' ...
'howpublished = {\url{http://pin.primate.wisc.edu/aboutp/behavior/jeb422.html}}, ' ...
'volume = {15}, ' ...
'doi = {10.1046/j.1010-061X.2002.00422.x}, '...
'pages = {595--607}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Saimiri_sciureus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Saimiri_sciureus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

