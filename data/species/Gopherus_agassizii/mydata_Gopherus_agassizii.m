function [data, auxData, metaData, txtData, weights] = mydata_Gopherus_agassizii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Gopherus_agassizii'; 
metaData.species_en = 'Desert tortoise'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 118;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'AnAge';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5500;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5500;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 62.8*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 152 yr';
  
data.Lb = 4.7; units.Lb = 'cm';   label.Lb = 'plastron length at birth';   bibkey.Lb = 'MediNuss2012';
data.Lp = 17.9; units.Lp = 'cm';   label.Lp = 'plastron length at puberty for females';   bibkey.Lp = 'MediNuss2012';
data.Lpm = 18.2; units.Lpm = 'cm';   label.Lpm = 'plastron length at puberty for males';   bibkey.Lpm = 'MediNuss2012';
data.Li = 22.6; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';   bibkey.Li = 'MediNuss2012';
data.Lim = 26; units.Lim = 'cm';   label.Lim = 'ultimate plastron length for males';   bibkey.Lim = 'MediNuss2012';

data.Wwb = 27.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ErnsBarb1989';
  comment.Wwb = 'based on egg length of 43 mm and width 35 mm: pi/6*4.3*3.5^2';
data.Wwp = 1229; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 1292; units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'guess';
  comment.Wwpm = 'based on (Lpm/Lim)^3*Wwim';
data.Wwi = 2473; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of G. polyphemus: (22.6/29.5)^3*5500';
data.Wwim = 3765; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of G. polyphemus: (26/29.5)^3*5500';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (d), plastron length (cm)
0.863	4.778
1.938	5.526
2.871	6.373
3.804	7.370
4.808	8.466
5.885	9.910
6.817	10.558
7.965	11.604
8.825	12.252
9.900	12.801
10.905	13.698
11.764	14.048
12.982	14.646
13.987	15.643
15.061	16.042
15.851	16.840
16.996	16.941
17.858	18.086
19.004	18.337
20.008	19.234
21.009	18.986
22.014	20.082
22.875	21.228
24.021	21.528
25.167	21.878
26.026	21.779
26.957	22.029
28.245	21.783
29.175	21.784
30.034	21.835
31.180	22.036
32.039	22.037
32.969	22.038
34.044	22.288
35.117	22.091
35.976	22.241
37.121	22.243
37.837	22.294
39.054	22.345
40.200	22.844
41.058	22.497
42.204	22.648
44.065	22.850];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'plastron length', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MediNuss2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), carapace length (cm)
0.863	4.878
1.866	5.228
2.942	6.423
4.019	7.619
4.807	8.167
6.100	9.861
7.032	10.658
8.037	11.654
8.825	12.153
9.972	12.801
10.904	13.300
11.835	13.650
12.911	14.597
13.699	14.846
15.060	15.644
15.994	16.790
16.853	17.090
17.931	18.683
18.861	18.436
20.007	19.035
21.013	20.479
22.016	21.177
23.092	22.074
24.023	22.374
24.884	23.221
26.030	23.421
26.889	23.671
27.963	23.722
28.895	24.271
29.969	24.621
30.973	25.369
32.047	25.569
32.907	25.819
33.909	25.721
34.982	25.623
36.056	25.724
37.058	25.825
37.989	25.976
39.063	25.927
39.993	25.829
41.068	26.378
41.997	26.081
43.000	26.132];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'plastron length', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MediNuss2012';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3H2LD'; % Cat of Life
metaData.links.id_ITIS = '173856'; % ITIS
metaData.links.id_EoL = '456478'; % Ency of Life
metaData.links.id_Wiki = 'Gopherus_agassizii'; % Wikipedia
metaData.links.id_ADW = 'Gopherus_agassizii'; % ADW
metaData.links.id_Taxo = '398391'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gopherus&species=agassizii'; % ReptileDB
metaData.links.id_AnAge = 'Gopherus_agassizii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gopherus_agassizii}}';
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
bibkey = 'MediNuss2012'; type = 'Article'; bib = [ ... 
'author = {P. A. Medica and K. E. Nussear and T. C. Esque and M. B. Saethre}, ' ... 
'year = {2012}, ' ...
'title = {Long-Term Growth of Desert Tortoises (\emph{Gopherus agassizii}) in a Southern {N}evada Population}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {46}, ' ...
'number = {2}, ' ...
'pages = {213--220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Gopherus_agassizii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gopherus_agassizii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...  
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


