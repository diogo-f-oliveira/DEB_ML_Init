function [data, auxData, metaData, txtData, weights] = mydata_Aneides_flavipunctatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Aneides_flavipunctatus'; 
metaData.species_en = 'Black salamander'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 27]; 


%% set data
% zero-variate data

data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Stau2016';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.5;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth '; bibkey.Lb  = 'Stau2016'; 
data.Lp  = 5.4;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'Stau2016'; 
data.Li  = 8.7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Stau2016';

data.Wwi = 13.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Desmognathus quadramaculatus: (8.7/9)^3*14.6';

data.Ri  = 28/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '28 eggs per clutch, 1 clutch each yr';

% univariate data
% time-length
data.LdL_f = [ ... % SVL (cm), change in SVL (mum/d)
2.778	79.138
2.893	72.408
2.944	72.404
3.115	79.351
3.173	75.746
3.333	114.613
3.975	25.282
4.193	4.384
4.348	30.772
4.363	29.571
4.379	15.170
4.465	14.923
4.488	60.761
4.559	6.515
4.613	33.631
4.663	39.387
4.693	26.664
4.757	32.419
4.759	18.739
4.779	26.657
4.885	40.089
4.898	54.488
4.930	25.445
5.081	20.153
5.216	35.263
5.312	11.495
5.578	10.274
5.663	16.747
5.842	18.892
5.921	16.966
6.027	31.358
6.152	7.108
6.210	8.303
6.297	-4.904
6.374	14.050
6.562	-2.045
6.569	1.554
6.590	8.513
6.604	13.072
6.911	22.887
7.041	17.117
7.364	16.851
7.538	-1.163
7.898	-10.072];
data.LdL_f(:,2) = data.LdL_f(:,2) * 1e-4; % convert mum to d
units.LdL_f  = {'cm', 'cm/d'}; label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(15); units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Stau2016';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (mum/d)
5.614	10.031
5.676	25.386
5.849	21.052
5.856	23.451
5.999	28.480
6.456	-10.917
6.484	-8.279
6.595	25.552
6.625	16.910
6.833	14.253
6.919	15.686
7.006	12.079
7.041	13.996
7.043	1.036
7.235	16.861
7.281	-10.023
7.288	-7.143
7.366	-1.389
7.496	-5.240
7.580	11.553
8.005	-5.281];
data.LdL_m(:,2) = data.LdL_m(:,2) * 1e-4; % convert mum to d
units.LdL_m  = {'cm', 'cm/d'}; label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(15); units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Stau2016';
comment.LdL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Terrestrial reproduction, direct divelopment';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DW57'; % Cat of Life
metaData.links.id_ITIS = '173701'; % ITIS
metaData.links.id_EoL = '1048232'; % Ency of Life
metaData.links.id_Wiki = 'Aneides_flavipunctatus'; % Wikipedia
metaData.links.id_ADW = 'Aneides_flavipunctatus'; % ADW
metaData.links.id_Taxo = '47440'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Aneides+flavipunctatus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aneides_flavipunctatus}}';
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
bibkey = 'Stau2016'; type = 'Article'; bib = [ ... 
'author = {Nancy L. Staub}, ' ... 
'year = {2016}, ' ...
'title = {Age, Sexual Dimorphism, and Growth Rates in the Black Salamander, \emph{Aneides flavipunctatus} ({P}lethodontidae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {104(1)}, ' ...
'pages = {52-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Aneides+flavipunctatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

