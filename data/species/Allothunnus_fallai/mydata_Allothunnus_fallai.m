function [data, auxData, metaData, txtData, weights] = mydata_Allothunnus_fallai
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Allothunnus_fallai'; 
metaData.species_en = 'Slender tuna'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAS','MIS','MPS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 04];

%% set data
% zero-variate data

data.ab = 3.5;        units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'guess';   
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 42*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'BradArkh2020';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 45;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based Katsuwonus_pelamis';
data.Li  = 105;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm: pi/6*0.105^3';
data.Wwp = 1.05e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00955*Lp^3.05, see F1';
data.Wwi = 13.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.05, see F1, gives 13.7 kg';

data.Ri  = 1e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
12.249	75.844
12.942	74.483
13.100	77.016
13.101	75.848
13.950	80.722
14.006	75.462
14.058	77.995
14.962	78.584
14.963	77.025
15.070	76.246
15.975	77.225
16.026	80.147
16.027	77.809
16.932	77.813
16.933	76.060
16.988	73.528
17.091	79.762
17.143	81.711
17.145	79.178
17.941	82.883
17.995	81.714
17.996	80.740
17.998	77.039
18.898	84.056
18.901	78.991
19.004	85.810
19.005	85.031
19.006	81.914
19.007	81.330
19.009	77.044
19.168	78.213
19.169	76.071
19.806	78.801
20.020	77.828
21.030	79.975
21.932	84.265
21.933	83.291
21.934	82.317
21.935	81.733
22.998	82.907
22.999	80.179
23.849	83.300
23.902	84.664
23.955	85.249
23.957	80.963
23.958	80.184
24.063	82.132
24.914	83.695
24.967	82.916
25.023	78.825
25.925	84.089
26.033	80.973
26.936	85.262
26.986	89.548
26.990	82.925
27.043	84.094
27.685	78.058
27.895	83.903
28.902	90.337
28.905	84.882
29.014	81.960
29.015	81.376
29.971	83.913
30.024	83.134
30.075	87.030
30.928	85.865
30.984	80.996
33.907	88.217];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5)*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(18.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BradArkh2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
8.954	67.841
9.964	69.989
10.922	70.188
12.998	69.224
13.051	70.198
13.956	69.618
14.008	72.930
14.059	76.242
14.965	74.882
15.020	71.181
16.030	72.744
16.083	73.913
16.139	69.044
16.883	70.605
16.935	72.943
16.987	75.281
17.946	74.312
17.948	70.805
18.001	71.779
18.002	69.831
18.104	76.260
19.064	73.927
19.066	70.810
19.116	75.291
19.118	72.953
19.968	75.685
20.074	76.854
20.077	71.594
20.818	78.806
20.872	77.832
20.981	73.352
21.032	75.884
21.830	77.252
21.884	76.278
21.992	73.551
22.894	79.010
22.895	77.841
23.906	76.677
24.012	78.041
24.863	77.655
24.864	77.071
24.865	75.902
24.918	75.123
24.919	74.149
24.970	79.020
24.975	69.474
25.928	78.050
25.984	74.349
26.034	80.388
26.037	75.128
26.089	76.297
26.833	79.613
26.886	78.444
26.991	81.561
26.995	74.354
26.996	72.990
27.845	77.474
28.007	73.774
28.963	77.090
29.015	79.233
29.866	80.016
29.919	80.991
30.028	76.121
30.985	78.268
30.986	77.294
31.838	76.129
32.903	76.329
35.938	74.785
38.812	76.357
39.818	85.322
39.981	79.674
42.003	81.047];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5)*365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(18.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BradArkh2020';
comment.tL_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.00955*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BZQW'; % Cat of Life
metaData.links.id_ITIS = '172460'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Allothunnus_fallai'; % Wikipedia
metaData.links.id_ADW = 'Allothunnus_fallai'; % ADW
metaData.links.id_Taxo = '160446'; % Taxonomicon
metaData.links.id_WoRMS = '219707'; % WoRMS
metaData.links.id_fishbase = 'Allothunnus-fallai'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...187059
'howpublished = {\url{http://en.wikipedia.org/wiki/Allothunnus_fallai}}';
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
bibkey = 'BradArkh2020'; type = 'Article'; bib = [ ... 
'doi = {110.1111/jfb.14469}, ' ...
'author = {Kirsty. A. Bradley and Alexander Arkhipkin}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth of slender tuna (\emmph{Allothunnus fallai}) in an unexploited temperate population}, ' ...
'journal = {Fish Biology}, ' ...
'volume = {97(4)}, ' ...
'pages = {1257-1261}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Allothunnus-fallai.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
