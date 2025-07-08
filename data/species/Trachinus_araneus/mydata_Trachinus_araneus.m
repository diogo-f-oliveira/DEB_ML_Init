function [data, auxData, metaData, txtData, weights] = mydata_Trachinus_araneus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Trachinidae';
metaData.species    = 'Trachinus_araneus'; 
metaData.species_en = 'Spotted weever'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.6); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 12];

%% set data
% zero-variate data

data.ab = 12.5;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(18.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'HeneRizk2022';   
  temp.am = C2K(18.6);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp  = 10.2;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Trachinus draco: 12*45/53';
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.89e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.04 mm: pi/6*0.104^3';
data.Wwp = 9.22;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01047*Lp^2.92, see F1';
data.Wwi = 704;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^2.92, see F1';
 
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Trachinus draco';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 12.48
    2 18.05
    3 22.49
    4 25.44
    5 27.67
    6 29.50];  
data.tL(:,1) = (0.4+data.tL(:,1))*365; % convert to yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(18.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeneRizk2022'; 
  
% length-weight
data.LW_f = [ ... total length (cm), weight (g)
14.944	20.071
14.951	24.470
15.032	18.970
15.574	20.610
15.764	27.204
16.040	31.048
16.478	24.442
16.663	27.188
16.851	32.682
17.021	26.631
17.401	38.721
17.486	35.970
17.744	29.367
18.106	31.010
18.121	39.807
18.201	33.757
18.564	36.500
18.938	44.740
19.021	40.890
19.197	38.688
19.309	51.881
19.390	46.931
20.009	40.872
20.033	55.167
20.292	49.114
20.372	43.065
20.383	49.662
21.114	56.797
21.193	50.747
21.211	61.194
21.306	64.491
21.312	67.790
21.925	58.431
22.047	77.673
22.099	55.129
22.131	74.373
22.291	62.823
22.392	69.419
22.939	73.808
23.015	65.559
23.108	67.757
23.113	70.506
23.125	77.653
23.222	82.050
23.236	90.297
23.479	74.348
23.660	75.444
24.027	79.836
24.054	96.331
24.221	88.630
24.226	91.379
24.295	79.281
24.395	85.328
24.941	89.167
25.037	93.014
25.040	94.663
25.053	102.360
25.058	105.659
25.065	109.508
25.140	100.709
25.160	112.805
26.075	122.685
26.420	114.432
26.504	110.581
27.156	124.865
27.323	117.164
27.328	119.913
27.411	116.063
27.492	110.563
28.155	130.895
28.161	134.743
28.256	138.040
28.261	140.790
30.354	156.696];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'HeneRizk2022';
%
data.LW_m = [ ... total length (cm), weight (g)
13.841	19.649
15.075	21.614
15.866	27.018
15.868	23.088
16.129	28.982
16.568	32.912
16.923	30.456
17.012	28.000
17.361	35.368
17.889	37.333
17.892	32.421
17.975	40.281
18.595	36.351
19.031	44.702
19.122	40.772
19.825	44.702
20.088	48.140
20.174	52.070
20.521	60.912
20.609	60.912
21.054	55.018
21.057	50.596
21.317	57.965
21.668	60.421
21.928	67.789
21.929	66.316
22.015	70.737
22.454	73.684
22.807	73.193
22.893	77.123
22.898	70.246
22.980	79.579
24.121	89.404
24.124	84.000
25.259	102.667
26.834	124.772];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'HeneRizk2022';

%% set weights for all real data
weights = setweights(data, []);
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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01047*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PDH'; % Cat of Life
metaData.links.id_ITIS = '170993'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Trachinus_araneus'; % Wikipedia
metaData.links.id_ADW = 'Trachinus_araneus'; % ADW
metaData.links.id_Taxo = '189229'; % Taxonomicon
metaData.links.id_WoRMS = '127081'; % WoRMS
metaData.links.id_fishbase = 'Trachinus-araneus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachinus_araneus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Trachinus-araneus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeneRizk2022'; type = 'article'; bib = [ ...  
'author = {Rasha Ali Heneish and Samir Ibrahim Rizkalla and Ezzat Mohammed-AbdAllah}, ' ...
'year = {2022}, ' ...
'title  = {Age Composition, Growth and Mortality of Spotted Weever (\emph{Trachinus araneus} {C}uvier, 1829) and Greater Weever (\emph{Trachinus draco} {L}innaeus, 1758) from the Western {E}gyptian {M}editerranean {S}ea}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = 26(4)}, ' ...
'pages = {1039-1051}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
