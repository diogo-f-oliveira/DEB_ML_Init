function [data, auxData, metaData, txtData, weights] = mydata_Desmognathus_ochrophaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Desmognathus_ochrophaeus'; 
metaData.species_en = 'Allegheny Mountain dusky salamander'; 

metaData.ecoCode.climate = {'Dfb'};
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
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 15];

%% set data
% zero-variate data

data.ab = 56;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KeenOrr1980';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6-10 wk';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'KeenOrr1980';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.95;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Bruc1990';
data.Lp  = 3.2;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'KeenOrr1980';
  comment.Lp = '3.0-3.4 cm';
data.Li  = 4.6;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Bruc2016';

data.Wwb = 1.56e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Bruc1990';
  comment.Wwb = 'based on egg diameter of 3.1 mm (2.7 to 3.6 mm): pi/6*0.31^3';
data.Wwi = 2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on D. monticola: (4.6/6.6)^3*6';

data.Ri  = 27/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Till1973';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '26 eggs per clutch (13 to 39), 1 clutch each other yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
  0.5 1.10
  1   1.38
  1.5 1.80
  2   2.17
  2.5 2.68
  3   3.20 % added from (tp,Lp)
];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'snout-to-vent length'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bruc1990';
comment.tL = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

% length-fecundity
data.LN = [ ... % SVL (cm), clutch size
3.677	14.160
3.681	11.866
3.694	16.240
3.713	20.113
3.741	13.375
3.760	17.033
3.761	12.516
3.761	12.803
3.768	17.750
3.780	16.317
3.786	15.242
3.796	17.178
3.799	20.118
3.819	12.663
3.826	13.166
3.878	14.244
3.883	18.331
3.889	17.184
3.895	16.253
3.916	16.254
3.918	17.186
3.936	15.108
3.971	20.057
3.974	16.114
3.979	20.559
3.985	13.821
3.994	14.897
3.994	21.206
4.004	17.263
4.009	15.901
4.012	18.196
4.021	19.845
4.022	20.347
4.032	16.906
4.037	15.330
4.067	16.335
4.089	22.359
4.091	18.416
4.106	18.990
4.142	19.064
4.143	19.638
4.173	15.195
4.176	17.489
4.190	17.131
4.196	16.343
4.200	19.354
4.200	19.856
4.202	21.219
4.235	18.926
4.278	18.571
4.287	20.292
4.288	21.367
4.289	22.156
4.290	17.281
4.292	18.213
4.298	23.304
4.304	28.322
4.327	23.592
4.358	25.315
4.377	23.308
4.384	17.359
4.392	24.098
4.397	22.163
4.400	24.385
4.400	19.224
4.416	25.605];
units.LN  = {'cm', '#'}; label.LN = {'SVL', 'clutch size'};  
temp.LN   = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Till1973';
comment.LN = 'Data for Mt Mitchell 914 m';

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
metaData.links.id_CoL = '353MR'; % Cat of Life
metaData.links.id_ITIS = '1106213'; % ITIS
metaData.links.id_EoL = '331056'; % Ency of Life
metaData.links.id_Wiki = 'Desmognathus_ochrophaeus'; % Wikipedia
metaData.links.id_ADW = 'Desmognathus_ochrophaeus'; % ADW
metaData.links.id_Taxo = '47398'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Desmognathus+ochrophaeus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Desmognathus_ochrophaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmognathus_ochrophaeus}}';
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
bibkey = 'Bruc1990'; type = 'Article'; bib = [ ... 
'author = {Richard C. Bruce}, ' ... 
'year = {1990}, ' ...
'title = {An Explanation for Differences in Body Size between Two {D}esmognathine Salamanders}, ' ...
'journal = {Copeia}, ' ...
'volume = {1990(1)}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeenOrr1980'; type = 'Article'; bib = [ ... 
'doi = {10.1643/CE-14-204}, ' ...
'author = {W. Hubert Keen and Lowell P. Orr}, ' ... 
'year = {1980}, ' ...
'title = {Reproductive Cycle, Growth, and Maturation of Northern Female \emph{Desmognathus ochrophaeus}}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {14(1)}, ' ...
'pages = {7-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Till1973'; type = 'Article'; bib = [ ... 
'author = {Stephen G. Tilley}, ' ... 
'year = {1973}, ' ...
'title = {Life Histories and Natural Selection in Populations of the Salamander \emph{Desmognathus ochrophaeus}}, ' ...
'journal = {Ecology}, ' ...
'volume = {54(1)}, ' ...
'pages = {3-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Desmognathus+ochrophaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Desmognathus_ochrophaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

