function [data, auxData, metaData, txtData, weights] = mydata_Mullus_surmuletus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Mullus_surmuletus'; 
metaData.species_en = 'Surmullet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 25];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 14;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AminMadk2016'; 
data.Li  = 40;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'AminMadk2016';
  comment.Wwb = 'based on egg diameter of 0.5-0.7 mm: pi/6*0.06^3';
data.Wwp = 32.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'fishbase','AminMadk2016'};
  comment.Wwp = 'based on 0.00891*Lp^3.11, see F1';
data.Wwi = 855.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.11, see F1';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (yr), total length (cm)
    1 13.39 13.32
    2 15.41 15.47
    3 19.31 18.39
    7 NaN   26.08];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(10.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ArslIsme2013'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ...  % total length (cm), wet weight (g)
10.951	15.556
11.337	15.556
11.446	16.667
11.611	17.778
11.886	18.889
12.215	25.556
12.216	22.222
12.272	17.778
12.546	24.444
12.547	21.111
12.877	20.000
12.931	27.778
13.207	23.333
13.370	32.222
13.482	25.556
13.755	35.556
13.811	27.778
13.812	23.333
14.141	28.889
14.251	33.333
14.470	37.778
14.581	33.333
14.690	41.111
14.909	43.333
14.911	36.667
15.296	37.778
15.404	46.667
15.405	41.111
15.680	45.556
15.846	41.111
15.899	51.111
16.064	51.111
16.175	48.889
16.175	44.444
16.503	57.778
16.944	57.778
17.053	63.333
17.163	62.222
17.440	54.444
17.547	71.111
17.658	62.222
17.767	72.222
18.262	70.000
18.536	81.111
18.647	75.556
18.648	70.000
19.855	92.222
20.129	98.889
20.347	107.778
20.569	101.111
20.733	105.556
21.333	135.556
21.718	135.556
26.874	236.667];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','wet weight','females'};  
bibkey.LW_f = 'ArslIsme2013';
%
data.LW_m = [ ...
11.551	19.547
11.779	21.336
11.917	20.617
12.237	23.480
12.375	22.761
12.649	25.983
12.786	25.981
13.015	28.128
13.151	30.277
13.154	24.184
13.336	28.482
13.426	30.631
13.475	25.613
13.747	32.777
13.839	30.984
13.929	35.284
13.932	28.832
14.019	38.150
14.021	33.849
14.160	30.979
14.387	35.994
14.389	33.126
14.478	38.501
14.572	32.407
14.614	41.008
14.708	37.423
14.801	34.196
14.892	35.987
15.027	42.436
15.074	39.927
15.077	33.475
15.299	47.450
15.303	39.206
15.439	43.864
15.485	42.430
15.620	48.879
15.805	44.934
15.849	48.518
15.941	49.233
16.080	44.930
16.396	57.112
16.536	52.450
16.580	55.676
16.718	54.240
16.989	64.989
17.308	69.644
17.357	62.833
17.450	60.323
17.539	65.698
17.767	67.845
17.768	66.770
18.589	77.152
18.862	80.733
18.999	83.598
19.593	88.607
19.866	91.829];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','wet weight','males'};  
bibkey.LW_m = 'ArslIsme2013';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
14.337	20874.882
15.696	22755.808
16.327	31299.282
17.104	43655.663
18.188	47307.843
18.981	84273.812];
units.LN   = {'cm', 'cm'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(10.2);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AminMadk2016'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00891*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44K4P'; % Cat of Life
metaData.links.id_ITIS = '169418'; % ITIS
metaData.links.id_EoL = '46578731'; % Ency of Life
metaData.links.id_Wiki = 'Mullus_surmuletus'; % Wikipedia
metaData.links.id_ADW = 'Mullus_surmuletus'; % ADW
metaData.links.id_Taxo = '45356'; % Taxonomicon
metaData.links.id_WoRMS = '126986'; % WoRMS
metaData.links.id_fishbase = 'Mullus-surmuletus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mullus_surmuletus}}';
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
bibkey = 'ArslIsme2013'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2011.01907.x}, ' ...
'author = {Mukadder Arslan and Ali I\c{s}men}, ' ... 
'year = {2013}, ' ...
'title = {Age, growth and reproduction of \emph{Mullus surmuletus} ({L}innaeus, 1758) in {S}aros {B}ay (Northern {A}egean {S}ea)}, ' ...
'journal = {J. Black Sea/Mediterranean Environment}, ' ...
'volume = {19(2)}, ' ...
'pages = {217˗233}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AminMadk2016'; type = 'Article'; bib = [ ... 
'author = {Amal M. Amin and Fedekar F. Madkour and Mohamed A. Abu El-Regal and Ahmed A. Moustafa}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive biology of \emph{Mullus surmuletus} ({L}innaeus,1758) from the {E}gyptian {M}editerranean {S}ea ({P}ort {S}aid)}, ' ...
'journal = {International Journal of Environmental Science and Engineering (IJESE)}, ' ...
'volume = {7}, ' ...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mullus-surmuletus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
