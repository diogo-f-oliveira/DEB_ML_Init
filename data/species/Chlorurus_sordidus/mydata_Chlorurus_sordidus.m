function [data, auxData, metaData, txtData, weights] = mydata_Chlorurus_sordidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Chlorurus_sordidus'; 
metaData.species_en = 'Daisy parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TaylChoat2014';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 67; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^3.10, see F1';
data.Wwi = 1.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^3.10, see F1';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
1	11.370 11.161
2	15.044 15.777
3	17.670 19.346
4	20.035 22.810
5	22.086 25.908];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'std length'};  
temp.tL_fm    = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AliOsma2010'; treat.tL_fm = {1 {'females','males'}};

% length-weight
data.LW_f = [ ... % std length (cm), weight (g)
13.472	67.752
15.042	90.361
17.458	120.525
17.850	123.550
18.756	180.640
19.028	201.669
19.058	168.651
19.450	201.695
20.054	218.241
20.537	227.276
20.537	194.255
21.232	197.299
21.262	218.314
21.534	279.869
21.957	243.872
22.289	327.944
22.349	269.411
22.832	321.973
22.983	448.061
23.013	323.485
23.104	282.965
23.164	352.012
23.557	349.033
23.587	290.499
23.829	386.573
24.161	323.554
24.402	406.120
25.368	449.705];
units.LW_f   = {'cm','g'};  label.LW_f = {'std length','weight','females'};  
bibkey.LW_f = 'AliOsma2010'; 
%
data.LW_m = [ ... % std length (cm), weight (g)
19.058	210.677
19.722	198.709
19.813	159.690
20.085	248.262
20.628	237.788
20.779	252.807
21.021	230.307
21.141	266.337
21.141	279.845
21.171	249.828
21.353	303.873
21.564	242.347
21.564	231.841
21.624	294.884
21.655	318.900
21.745	230.350
21.866	260.377
22.107	255.888
22.258	309.931
22.440	267.916
22.560	287.435
22.560	207.885
22.591	354.979
22.742	348.984
22.772	306.960
22.923	296.462
23.013	275.455
23.074	338.498
23.225	346.012
23.315	320.501
23.376	300.992
23.557	361.041
23.738	331.033
23.979	368.571
23.979	343.055
24.523	356.596
24.614	401.630
25.882	460.242
26.365	526.313
26.727	560.856
27.935	611.960
29.173	514.474];
units.LW_m   = {'cm','g'};  label.LW_m = {'std length','weight','males'};  
bibkey.LW_m = 'AliOsma2010'; 

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
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01514*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69Z8N'; % Cat of Life
metaData.links.id_ITIS = '613235'; % ITIS
metaData.links.id_EoL = '46572680'; % Ency of Life
metaData.links.id_Wiki = 'Chlorurus_sordidus'; % Wikipedia
metaData.links.id_ADW = 'Chlorurus_sordidus'; % ADW
metaData.links.id_Taxo = '170930'; % Taxonomicon
metaData.links.id_WoRMS = '219082'; % WoRMS
metaData.links.id_fishbase = 'Chlorurus-sordidus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chlorurus_sordidus}}';
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
bibkey = 'AliOsma2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2010.01566.x}, ' ...
'author = {T. El-Sayed Ali and A. M. Osman and S. H. Abdel-Aziz and F. A. Bawazeer}, ' ... 
'year = {2010}, ' ...
'title = {Growth and longevity of the protogynous parrotfish, \emph{Hipposcarus harid}, \emph{Scarus ferrugineus} and \emph{Chlorurus sordidus} ({T}eleostei, {S}caridae), off the eastern coast of the {R}ed {S}ea}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {27}, ' ...
'pages = {840–846}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chlorurus-sordidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

