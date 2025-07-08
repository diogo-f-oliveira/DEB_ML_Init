function [data, auxData, metaData, txtData, weights] = mydata_Gymnocanthus_intermedius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Gymnocanthus_intermedius'; 
metaData.species_en = 'Whip sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 3 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 12 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(7.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.9;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Panc2012'; 
  comment.Lp = 'based on ap = 2 yr, from tL_f data';
data.Lpm  = 12.1;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Panc2012'; 
  comment.Lpm = 'based on ap = 2 yr, from tL_m data';
data.Li  = 23;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
 
data.Ri = 3.2e3/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found for Cottis volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 8.0
    2 12.9
    3 15.6
    4 17.3
    5 18.7
    6 19.5
    7 20.7];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Panc2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1 7.5
    2 12.1
    3 14.9
    4 16.7
    5 18.1
    6 19.1];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Panc2012';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
10.153	16.732
10.181	11.455
10.690	16.475
10.718	13.209
10.916	17.981
11.029	13.457
11.199	18.480
11.482	14.709
11.595	18.979
11.878	21.237
11.906	14.453
12.132	30.531
12.528	25.000
12.641	14.446
12.670	30.526
12.839	19.971
13.066	30.522
13.377	40.318
13.942	40.563
14.225	30.008
14.451	40.558
14.564	25.482
14.734	34.274
14.847	35.278
15.130	51.355
15.130	29.747
15.187	35.526
15.300	60.650
15.554	39.793
15.696	49.088
15.781	70.444
15.837	39.791
15.979	34.513
16.176	40.038
16.714	40.536
17.025	34.754
17.166	50.330
17.393	71.684
17.421	81.483
17.704	100.827
17.732	70.676
17.760	50.073
18.015	60.874
18.184	101.074
18.213	80.721
18.411	101.574
18.439	50.317
18.467	44.538
18.524	60.869
18.552	69.663
18.778	90.766
18.863	60.363
18.948	120.915
18.976	131.970
19.118	101.064
19.118	91.014
19.146	70.662
19.146	66.139
19.485	80.457
19.514	121.663
19.514	101.060
19.514	91.261
19.768	101.309
19.966	111.608
20.249	90.500
20.701	90.747
21.126	111.094
22.426	110.830];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Panc2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Ri = weights.Ri * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6L6V2'; % Cat of Life
metaData.links.id_ITIS = '643998'; % ITIS
metaData.links.id_EoL = '46568960'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocanthus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocanthus_intermedius'; % ADW
metaData.links.id_Taxo = '175538'; % Taxonomicon
metaData.links.id_WoRMS = '274374'; % WoRMS
metaData.links.id_fishbase = 'Gymnocanthus-intermedius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocanthus}}';
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
bibkey = 'Panc2012'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210040028}, ' ...
'author = {V. V. Panchenko}, ' ... 
'year = {2012}, ' ...
'title = {Growth and Age of Staghorn Sculpins of the Genus \emph{Gymnocanthus} ({C"}ottidae) in {P}eter the {G}reat {B}ay and Adjacent Waters of {P}rimorye ({S}ea of {J}apan)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {52}, ' ...
'pages = {226-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocanthus-intermedius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

