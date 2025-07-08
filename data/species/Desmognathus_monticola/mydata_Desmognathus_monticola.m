function [data, auxData, metaData, txtData, weights] = mydata_Desmognathus_monticola
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Desmognathus_monticola'; 
metaData.species_en = 'Seal salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww';'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 10]; 


%% set data
% zero-variate data

data.ab = 49;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Plethodon cinereus';
data.tp = 1.6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Bruc2016';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 6.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Bruc2016';

data.Wwb = 4.46e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 4.4 mm (4.0 to 4.8 mm): pi/6*0.44^3';
data.Wwi = 6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Bruc2016';

data.Ri  = 27/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '26 eggs per clutch (13 to 39), 1 clutch each other yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.945	1.790
0.946	1.925
0.985	1.681
1.232	2.359
1.393	1.953
1.477	2.359
1.478	2.631
1.478	2.712
1.516	2.142
1.520	2.902
1.720	2.224
1.802	2.359
1.924	2.386
1.965	2.495
1.966	2.685
1.967	2.793
2.008	2.902
2.050	3.146
2.498	3.281
2.622	3.661
2.664	3.824
2.665	4.041
2.948	3.824
3.231	3.444
3.274	3.932
3.275	4.149
3.479	4.095
3.603	4.637
3.604	4.800
3.767	4.719
3.768	4.963
3.769	5.125
4.663	5.017
4.702	4.773
4.707	5.668
4.707	5.722
4.708	5.831
4.746	5.315
4.826	5.153
5.068	4.746
5.562	5.803
5.562	5.858
5.563	5.966
5.563	6.102
5.564	6.292
5.602	5.668
5.723	5.451
6.174	6.210
6.661	5.939
6.661	6.047
6.703	6.183
7.598	6.156
7.721	6.427
7.761	6.292
8.007	6.644
8.494	6.536
8.534	6.346
10.612	7.078];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'snout-to-vent length'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bruc2016';
comment.tL = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.939	0.118
0.964	0.177
1.192	0.295
1.192	0.222
1.548	0.576
1.548	0.414
1.548	0.354
1.548	0.295
1.700	0.295
1.903	0.443
1.903	0.532
1.903	0.650
1.928	0.340
2.486	0.709
2.613	1.063
2.613	1.152
2.613	1.359
3.197	1.418
3.222	1.285
3.222	1.181
3.222	0.827
3.450	1.418
3.501	2.023
3.526	2.141
3.577	2.289
3.628	2.053
3.653	2.673
3.679	2.422
4.592	2.895
4.617	3.441
4.617	3.544
4.617	3.677
4.617	3.869
4.617	2.540
4.617	2.023
4.643	2.806
4.643	2.363
4.947	2.378
5.505	3.899
5.556	4.667
5.632	3.825
5.658	4.357
5.658	4.076
5.658	3.249
5.683	3.914
6.266	4.608
6.596	4.578
6.622	4.489
6.647	4.357
6.672	4.002
6.672	4.076
6.672	4.179
6.672	4.297
7.535	4.534
7.611	4.549
7.662	4.962
7.662	4.755
7.915	5.789
8.499	5.346
8.702	4.859
10.579	6.719];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(15); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Bruc2016';
comment.tW = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

data.LN = [ ... % log SVL (mm), log follicle number (#)
4.097	3.088
4.099	3.176
4.106	3.215
4.158	3.369
4.159	3.133
4.186	3.215
4.199	3.091
4.200	3.365
4.214	3.524
4.230	3.784
4.252	3.463];
data.LN = exp(data.LN); % remove ln transformation
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN  = {'cm', '#'}; label.LN = {'time since birth', 'follicle number'};  
temp.LN   = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Bruc2013';
comment.LN = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '353MQ'; % Cat of Life
metaData.links.id_ITIS = '173640'; % ITIS
metaData.links.id_EoL = '1019222'; % Ency of Life
metaData.links.id_Wiki = 'Desmognathus_monticola'; % Wikipedia
metaData.links.id_ADW = 'Desmognathus_monticola'; % ADW
metaData.links.id_Taxo = '47398'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Desmognathus+monticola'; % AmphibiaWeb
metaData.links.id_AnAge = 'Desmognathus_monticola'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmognathus_monticola}}';
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
bibkey = 'Bruc2016'; type = 'Article'; bib = [ ... 
'doi = {10.1643/CE-14-204}, ' ...
'author = {Richard C. Bruce}, ' ... 
'year = {2016}, ' ...
'title = {Application of the {G}ompertz Function in Studies of Growth in Dusky Salamanders (\emph{Plethodontidae}: {D}esmognathus)}, ' ...
'journal = {Copeia}, ' ...
'volume = {104}, ' ...
'pages = {94-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bruc2013'; type = 'Article'; bib = [ ... 
'author = {Richard C. Bruce}, ' ... 
'year = {2013}, ' ...
'title = {Size-Mediated Tradeoffs in Life-History Traits in Dusky Salamanders}, ' ...
'journal = {Copeia}, ' ...
'volume = {2013}, ' ...
'pages = {262-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Desmognathus+monticola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Desmognathus_monticola}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

