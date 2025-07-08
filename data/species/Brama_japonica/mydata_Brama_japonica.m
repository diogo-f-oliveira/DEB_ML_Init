function [data, auxData, metaData, txtData, weights] = mydata_Brama_japonica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Bramidae';
metaData.species    = 'Brama_japonica'; 
metaData.species_en = 'Southern rays bream'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 28];

%% set data
% zero-variate data

data.am = 8*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'PearFish1993';   
  temp.am = C2K(9.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 36;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 61;     units.Li  = 'cm';  label.Li  = 'ultimate total length of female';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1.575 mm of Brama brama: pi/6*.1575^3';
data.Wwp = 678;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01738*Lp^2.95, see F1';
data.Wwi = 3.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738*Li^2.95, see F1';

data.Ri  = 8.4e4/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Based on kap = 0.97, as found for  Trichiurus nanhaiensis';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.050	29.505
0.041	21.826
0.041	22.664
0.040	25.038
0.040	25.596
0.030	22.385
0.030	23.153
0.029	24.200
0.029	26.853
0.018	23.712
0.017	27.900
0.008	21.129
0.007	26.156
0.015	24.620
0.948	39.099
0.948	39.657
0.958	35.050
0.969	33.864
0.969	34.492
0.969	35.539
0.969	36.098
0.970	37.354
0.970	38.611
0.970	40.565
0.971	41.263
0.979	32.328
0.979	32.887
0.981	37.773
0.981	38.262
0.981	40.217
0.990	31.421
0.991	33.306
1.000	28.280
1.003	36.727
1.004	42.521
1.004	43.010
1.012	31.003
1.934	45.620
1.955	40.665
1.955	41.502
1.955	42.061
1.955	42.480
1.955	43.108
1.965	39.618
1.966	41.014
1.967	43.736
1.967	44.435
1.967	44.993
1.976	37.175
1.988	40.107
2.972	41.184
2.974	48.095
2.984	45.303
2.995	42.929
3.969	45.891
3.969	46.868
3.980	46.240
3.990	42.261
5.008	43.618
5.927	50.347
5.949	49.719];
data.tL(:,1) = 365 * (.9 + data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(9.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PearFish1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01738*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '693BN'; % Cat of Life
metaData.links.id_ITIS = '170289'; % ITIS
metaData.links.id_EoL = '46577913'; % Ency of Life
metaData.links.id_Wiki = 'Brama_japonica'; % Wikipedia
metaData.links.id_ADW = 'Brama_japonica'; % ADW
metaData.links.id_Taxo = '164582'; % Taxonomicon
metaData.links.id_WoRMS = '273148'; % WoRMS
metaData.links.id_fishbase = 'Brama-japonica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brama_japonica}}';
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
bibkey = 'PearFish1993'; type = 'Article'; bib = [ ... 
'doi = {10.1139/f93-285}, ' ...
'author = {Pearcy, W. G. and Fisher, J. P. and Yoklavich, M. M.}, ' ... 
'year = {1993}, ' ...
'title = {Biology of the {P}acific Pomfret (\emph{Brama japonica}) in the {N}orth {P}acific {O}cean}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {50(12)}, ' ...
'pages = {2608–2625}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brama-japonicas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
