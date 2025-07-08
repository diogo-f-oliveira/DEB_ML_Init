function [data, auxData, metaData, txtData, weights] = mydata_Hapalemur_alaotrensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lepilemuridae';
metaData.species    = 'Hapalemur_alaotrensis'; 
metaData.species_en = 'Lac Alaotra bamboo lemur'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc  = [2018 18 07]; 

%% set data
% zero-variate data

data.tg = 135;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp is guessed';
data.tx = 85;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 880;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'value for Hapalemur griseus';
data.am = 23.3*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Hapalemur griseus';
  
data.Wwb = 95;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BeatFeis1998';
  comment.Wwb = 'Bsade on tW data, back-extrapolated to birth';
data.Wwi = 1250;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '1.1 till 1,4 kg, males slighly larger than females';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
19.994	147.722
26.350	177.956
34.117	217.087
40.474	240.193
48.239	288.236
54.593	322.034
61.653	361.173
68.478	398.531
76.013	423.408
82.837	464.330
90.134	499.902
96.487	537.265
104.245	613.823
111.319	597.713
118.144	636.854
124.030	658.182
132.033	697.311
139.569	718.623
146.634	739.940
152.752	773.741
159.822	775.454
167.577	862.704
173.931	896.503
181.240	885.738];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'BeatFeis1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Feeds on Papyrus, not bamboo';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3JK9Y'; % Cat of Life
metaData.links.id_ITIS = '944071'; % ITIS
metaData.links.id_EoL = '4454348'; % Ency of Life
metaData.links.id_Wiki = 'Hapalemur_alaotrensis'; % Wikipedia
metaData.links.id_ADW = 'Hapalemur_alaotrensis'; % ADW
metaData.links.id_Taxo = '1003272'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100049'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hapalemur_alaotrensis}}';
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
bibkey = 'BeatFeis1998'; type = 'Article'; bib = [ ... 
'author = {J .C. Beattie and A. T. C. Feistner}, ' ... 
'year = {2002}, ' ...
'title = {Husbandery and breeding of the {A}laotran gentle lemur \emph{Hapalemur griseus alaotrensis} at {Jersey Wildlife Preservation Trust}}, ' ...
'journal = {Int.Zool. Yb.}, ' ...
'volume = {36}, ' ...
'pages = {11--19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hapalemur_griseus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

