  function [data, auxData, metaData, txtData, weights] = mydata_Chrosomus_saylori

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Chrosomus_saylori'; 
metaData.species_en = 'Laurel dace'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 23];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 24]; 

%% set data
% zero-variate data
data.tp = 2*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'Whit2012';   
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.am = 6*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.5;  units.Lp = 'cm'; label.Lp = 'length at puberty'; bibkey.Lp = 'Wiki';
data.Li = 7.4;    units.Li = 'cm'; label.Li = 'ultimate length'; bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.6 mm of Phoxinus phoxinus: pi/6*0.16^3';
data.Wwi = 4.1;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.06, see F3';

data.Ri = 150/365; units.Ri = '#/d';  label.Ri = 'reprod rate for FL 40.2 cm';  bibkey.Ri = 'guess';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Phoxinus phoxinus: (7.4/14)^3*1e3 per yr';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (month), standard length (mm)
 3.049	28.960
2.983	31.056
2.983	32.105
10.951	41.078
10.977	51.078
12.015	36.726
12.014	38.823
11.980	40.516
11.916	41.242
11.947	42.210
13.005	47.051
12.973	46.245
12.942	45.035
12.977	41.083
12.913	40.035
13.043	38.342
13.011	37.212
14.966	47.702
14.999	46.250
15.000	45.444
14.971	40.202
14.940	38.347
15.037	37.621
14.974	35.363
14.943	33.992
16.003	35.204
16.999	37.304
16.966	37.949
17.029	40.127
16.964	41.175
17.028	41.981
17.023	49.078
22.040	47.479
23.067	50.546
22.968	55.304
23.996	56.758
23.999	50.952
24.064	50.387
27.015	61.524
26.984	60.395
26.984	59.589
26.985	58.056
27.018	57.331
26.987	55.395
26.955	54.831
26.956	53.702
26.924	52.734
27.022	51.282
26.958	50.637
27.024	47.815];
data.tL(:,1) = (.75 + data.tL(:,1)) * 30.5; % convert month to d
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Whit2012';

%  length-weight
data.LWw = [ ... % standard length(mm), wet weight (g)
 29.031	0.338
30.497	0.375
32.350	0.450
33.894	0.500
33.816	0.588
34.974	0.550
35.437	0.700
35.669	0.588
37.058	0.850
36.904	0.738
36.981	0.700
36.750	0.638
37.676	0.550
37.521	0.950
38.679	0.988
38.139	0.838
38.293	0.688
39.220	0.800
40.223	0.988
40.069	1.088
41.226	1.325
41.072	1.163
40.995	1.075
40.763	0.900
41.690	1.138
42.153	1.213
41.767	1.325
42.384	1.400
43.542	1.350
45.163	1.313
46.244	1.238
44.854	1.688
46.244	1.425
46.089	1.775
46.861	1.700
47.093	1.888
47.633	1.613
47.479	1.513
48.714	1.350
49.408	1.900
50.334	1.825
50.180	2.288
50.566	2.350
51.184	2.300
51.415	1.925
50.875	2.588
51.029	2.450
52.727	3.138
52.573	2.738
52.341	2.213
52.727	2.288
53.422	2.513
53.731	2.188
53.962	1.888
54.657	2.775
55.197	2.963
54.425	3.075
54.966	3.400
56.587	3.100
57.204	3.038
57.590	2.863
57.281	3.525
57.822	3.438
58.516	3.213
59.520	3.525
60.214	3.638
61.604	4.075];
data.LWw(:,1) = data.LWw(:,1)/10; % convert mm to cm
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'Whit2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'lower number of mature eggs per females and gonadosomatic index in comparison to other Chrosomus';
metaData.bibkey.F1 = 'Whit2012';
F2 = 'spawns of redds, gravel beds and sex ratio 3:1 F:M';
metaData.bibkey.F2 = 'Whit2012';
F3 = 'length-weight Ww in g = 0.00891*(TL in cm)^3.06';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5YHY8'; % Cat of Life
metaData.links.id_ITIS = '913997'; % ITIS
metaData.links.id_EoL = '219720'; % Ency of Life
metaData.links.id_Wiki = 'Chrosomus_saylori'; % Wikipedia
metaData.links.id_ADW = 'Phoxinus_saylori'; % ADW
metaData.links.id_Taxo = '2705598'; % Taxonomicon
metaData.links.id_WoRMS = '1010070'; % WoRMS
metaData.links.id_fishbase = 'Chrosomus-saylori'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Laurel_dace}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/61922}}';  
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
bibkey = 'Whit2012'; type = 'mastersthesis'; bib = [ ...  
'author = {White, S.}, ' ...
'year = {2012}, ' ...
'title = {Distribution and Life History of \emph{Chrosomus} sp. cf. saylori in the {U}pper {C}linch {R}iver {W}atershed, {V}irginia}, ' ... 
'school = {Virginia Polytechnic Institute and State University}, ' ...
'address = {Blacksburg, VA}, '...
'month = {nov}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

