function [data, auxData, metaData, txtData, weights] = mydata_Cephaloscyllium_albipinnum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Cephaloscyllium_albipinnum'; 
metaData.species_en = 'Whitefin swellshark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIS','MPSW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.6); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 25];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 25];

%% set data
% zero-variate data;
data.tp = 13*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Bell2012';   
  temp.tp = C2K(12.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 8*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Bell2012';   
  temp.tpm = C2K(12.6); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bell2012';   
  temp.am = C2K(12.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 16;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Cephaloscyllium isabellum';
data.Lp = 102.8;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females';bibkey.Lp  = 'Bell2012';
data.Lpm = 82.3; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Bell2012';
data.Li  = 102.5;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
  comment.Li = 'Wiki gives 110 cm';

data.Wwi  = 7.14e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00331*Li^3.15, see F3';

data.Ri  = 50/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Bell2012';   
  temp.Ri = C2K(12.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'enlarged ovarian oocytes at TL 100 cm';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
27.044	100.897
19.066	88.125
20.044	106.787
17.048	105.300
16.032	106.457
16.081	97.647
14.950	97.159
14.942	88.352
15.017	108.164
16.944	114.664
13.950	114.828
14.055	106.566
13.936	99.967
13.818	94.469
13.928	91.710
11.887	83.566
11.894	91.822
12.020	105.577
11.910	108.335
12.972	96.167
12.973	97.818
12.978	102.772
10.930	87.472
11.172	105.073
9.987	105.689
9.914	89.179
9.902	75.418
9.898	71.565
10.008	68.256
10.918	74.812
9.048	69.410
8.887	77.676
8.889	79.878
8.893	84.832
8.896	87.033
8.843	90.889
8.849	98.045
8.851	99.696
8.855	104.100
8.972	108.497
7.895	104.153
8.000	96.440
7.935	86.536
7.867	74.429
7.856	63.421
6.893	60.721
6.839	63.477
6.972	83.836
7.033	88.787
6.979	91.542
6.871	97.053
5.960	89.397
5.957	86.645
5.948	77.287
5.938	66.279
4.857	58.632
4.860	60.833
4.805	63.038
4.808	66.341
4.983	71.836
4.877	78.998
4.882	85.052
3.970	76.295
3.961	66.938
0.857	10.412];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(12.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bell2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
20.057	95.594
17.102	97.354
16.023	100.146
13.011	83.192
13.068	99.153
13.011	106.312
11.023	100.880
10.057	101.466
10.114	75.042
11.023	68.953
7.955	60.809
8.011	62.458
8.011	66.312
7.898	85.031
7.898	88.334
7.898	94.389
7.898	97.141
8.011	104.844
9.034	108.109
9.034	103.155
7.102	96.620
6.932	101.580
9.034	87.742
7.102	69.648
6.989	63.046
6.080	66.382
5.966	77.396
5.057	85.136
5.057	68.071
5.057	65.869
4.091	69.758
2.898	46.683
1.989	31.303];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(12.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bell2012';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'oviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00331 * (TL in cm)^3.15';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5XJXG'; % Cat of Life
metaData.links.id_ITIS = '160100'; % ITIS
metaData.links.id_EoL = '46559895'; % Ency of Life
metaData.links.id_Wiki = 'Cephaloscyllium_albipinnum'; % Wikipedia
metaData.links.id_ADW = 'Cephaloscyllium_albipinnum'; % ADW
metaData.links.id_Taxo = '1683956'; % Taxonomicon
metaData.links.id_WoRMS = '398241'; % WoRMS
metaData.links.id_fishbase = 'Cephaloscyllium-albipinnum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephaloscyllium_albipinnum}}';  
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
bibkey = 'Bell2012'; type = 'phdthesis'; bib = [ ... 
'author = {Justin David Bell}, ' ...
'year = {2012}, ' ...
'title  = {Reproduction and ageing of Australian holocephalans and white-fin swell shark}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cephaloscyllium-albipinnum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

