function [data, auxData, metaData, txtData, weights] = mydata_Amphistichus_argenteus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Embiotocidae';
metaData.species    = 'Amphistichus_argenteus'; 
metaData.species_en = 'Barred surfperch'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-Le'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 07];

%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CarlScho1960';   
  temp.am = C2K(12.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 4.4; units.Lb  = 'cm';  label.Lb  = 'std length at birth'; bibkey.Lb  = 'CarlScho1960'; 
data.Lp  = 16.4; units.Lp  = 'cm';  label.Lp  = 'std length at puberty for females'; bibkey.Lp  = 'CarlScho1960'; 
data.Li  = 43;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'fishbase';

% uni-variate data

% time-length for embryo
data.tLe = [ ... age (mnth), std length (cm)
0.961	0.690
1.956	1.336
1.989	1.202
2.972	1.391
2.983	2.805
3.978	3.050
3.989	2.660
4.950	3.718
4.983	4.263
5.978	4.475];  
data.tLe(:,1) = data.tLe(:,1)*30.5; % convert mnth to d
units.tLe   = {'d', 'cm'};  label.tLe = {'time since birth', 'std embryo length'};  
temp.tLe    = C2K(12.9);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'CarlScho1960';

% time-length
data.tL_fm = [ ... % time (d), std length (cm)
    0  8.99  8.57 
    1 12.65 12.82
    2 17.18 15.69
    3 22.13 20.88
    4 24.33 22.09
    5 26.82 23.46
    6 28.41 24.90
    7 29.72 NaN
    8 29.60 NaN
    9 33.70 NaN];
data.tL_fm(:,1) = 365 * (1.2+ data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(12.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CarlScho1960'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % time (d), weight (g)
    0   29.1  24.1
    1   85.6  86.0
    2  202.8 155.8
    3  405.3 333.5
    4  542.4 386.1
    5  732.4 462.9
    6  884.9 579.3
    7 1019.0 NaN
    8 1001.0 NaN
    9 1496.7 NaN];
data.tW_fm(:,1) = 365 * (1.2+ data.tW_fm(:,1)); % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(12.9);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'CarlScho1960'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % std length (cm), fecundity
16.425	14.420
17.817	4.680
18.372	11.341
18.864	13.049
19.312	21.221
19.440	19.278
19.677	13.238
19.909	30.681
20.062	14.303
20.466	24.846
20.723	23.114
20.811	12.339
20.959	18.798
21.216	20.728
21.495	13.394
21.581	12.314
21.813	26.095
21.921	23.506
21.986	16.179
22.072	17.469
22.157	20.052
22.284	29.311
22.393	15.951
22.540	28.657
22.730	42.223
22.883	26.276
22.969	22.611
23.204	26.266
23.267	30.572
23.332	28.847
23.503	25.610
23.587	39.180
23.675	24.311
23.784	12.243
24.060	24.730
24.249	40.666
24.315	32.262
24.512	7.049
24.657	36.344
24.827	38.062
24.852	21.904
24.979	26.424
25.147	43.007
25.194	21.031
25.321	27.059
25.598	36.960
25.682	42.774
25.939	39.965
26.047	34.576
26.198	31.555
26.386	56.324
26.709	42.526
26.883	27.655
27.135	52.422
27.224	34.753
27.265	45.524
27.473	74.171
27.973	30.205
28.472	112.702
28.934	38.791
28.976	42.237
29.337	56.444
29.721	62.895
29.807	60.307
29.983	37.896
30.410	37.882
31.006	55.313
31.224	34.409
32.049	87.165
32.589	55.908
35.026	64.663
36.117	62.042];
units.LN   = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN    = C2K(12.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CarlScho1960';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'D639'; % Cat of Life
metaData.links.id_ITIS = '169758'; % ITIS
metaData.links.id_EoL = '46572841'; % Ency of Life
metaData.links.id_Wiki = 'Amphistichus_argenteus'; % Wikipedia
metaData.links.id_ADW = 'Amphistichus_argenteus'; % ADW
metaData.links.id_Taxo = '160752'; % Taxonomicon
metaData.links.id_WoRMS = '279594'; % WoRMS
metaData.links.id_fishbase = 'Amphistichus-argenteus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amphistichus_argenteus}}';
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
bibkey = 'CarlScho1960'; type = 'techreport'; bib = [ ... 
'author = {Carlisle, John G. and Schott, Jack W. and Abramson, Norman J.}, ' ... 
'year = {1960}, ' ...
'title = {The Barred Surfperch (\emph{Amphistichus argenteus} {A}gassiz) in {S}outhern {C}alifornia}, ' ...
'institution = {STATE OF CALIFORNIA DEPARTMENT OF FISH AND GAME MARINE RESOURCES OPERATIONS}, ' ...
'series = {Fish Bulletin}, ' ...
'volume = {109}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Amphistichus-argenteus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
