function [data, auxData, metaData, txtData, weights] = mydata_Gyrinophilus_palleucus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Gyrinophilus_palleucus'; 
metaData.species_en = 'Tennessee cave salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 25]; 


%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Plethodon cinereus';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'NiemGlor2016';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'NiemGlor2016'; 
data.Li  = 11.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'NiemGlor2016';

data.Wwb = 1.72e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 3.2 mm: pi/6*0.32^3';
data.Wwi = 32.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Desmognathus quadramaculatus: (11.8/9)^3*14.6';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed: 12 eggs per clutch, 1 clutch each yr';

% univariate data
% time-length
data.LdL = [ ... % SVL (cm), change in SVL (cm/month)
4.59123	0.05156
4.92860	0.06516
5.14302	0.11702
5.24458	0.09406
5.71305	0.04001
5.86229	0.12891
5.98963	0.12866
6.28769	0.10275
6.40639	0.12794
6.48756	0.12893
6.53476	0.13659
6.98111	0.09142
7.04744	0.06427
7.16349	0.06649
7.19471	0.03613
7.33208	0.12255
7.33523	0.04971
7.40996	0.09515
7.54408	0.05343
7.69081	0.12059
7.80108	0.07294
7.85546	0.04257
7.92347	0.02999
8.31833	0.04013
8.33151	0.05395
8.34192	0.04383
8.35418	0.04976
8.40319	0.07297
8.45648	0.03322
8.64017	0.11965
8.79444	0.05200
8.93648	0.07867
8.94477	0.05028
8.95235	0.11571
9.13692	0.00979
9.13998	0.03621
9.14075	0.04288
9.33786	0.04511
9.48449	0.01154
9.54416	0.02685
9.65023	0.04290
9.79741	0.01402
10.02862	0.01082
10.05215	0.01403
10.25980	0.00737
10.30872	0.02985];
data.LdL(:,2) = data.LdL(:,2)/ 30.5; % convert month to d
units.LdL  = {'cm', 'cm/d'}; label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(15); units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'NiemGlor2016';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The larval stage is very long';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HYSV'; % Cat of Life
metaData.links.id_ITIS = '173714'; % ITIS
metaData.links.id_EoL = '1038942'; % Ency of Life
metaData.links.id_Wiki = 'Gyrinophilus_palleucus'; % Wikipedia
metaData.links.id_ADW = 'Gyrinophilus_palleucus'; % ADW
metaData.links.id_Taxo = '47420'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Gyrinophilus+palleucus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Gyrinophilus_palleucus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gyrinophilus_palleucus}}';
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
bibkey = 'NiemGlor2016'; type = 'Article'; bib = [ ... 
'author = {Matthew L. Niemiller and Brad M. Glorioso and Dante B. Fenolio and R. Graham Reynolds and Steven J. Taylor and Brian T. Miller}, ' ... 
'year = {2016}, ' ...
'title = {Growth, Survival, Longevity, and Population Size of the {B}ig {M}outh {C}ave Salamander (\emph{Gyrinophilus palleucus necturoides}) from the Type Locality in {G}rundy {C}ounty, {T}ennessee, {U}{S}{A}}, ' ...
'journal = {Copeia}, ' ...
'volume = {104(1)}, ' ...
'pages = {35-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Gyrinophilus+palleucus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gyrinophilus_palleucus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

