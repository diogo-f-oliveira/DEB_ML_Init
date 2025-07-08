function [data, auxData, metaData, txtData, weights] = mydata_Gopherus_agassizii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Gopherus_morafkai'; 
metaData.species_en = 'Sonoran desert tortoise'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 10];

%% set data
% zero-variate data

data.ab = 118;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'AnAge';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Gopherus agassizii';
data.tp = 16*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Brid2012';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 80*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Brid2012';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb = 4.2; units.Lb = 'cm';   label.Lb = 'mid-line carapace at birth';   bibkey.Lb = 'guess';
data.Lp = 19.4; units.Lp = 'cm';   label.Lp = 'mid-line carapace at puberty for females';   bibkey.Lp = 'Brid2012';
  comment.Lp = 'based on tL data at tp';
data.Li = 27; units.Li = 'cm';   label.Li = 'ultimate mid-line carapace for females';   bibkey.Li = 'Brid2012';

data.Wwb = 22.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AverChri2018';
  comment.Wwb = 'based on egg diameter of 35 mm: pi/6*3.5^3';
data.Wwi = 4.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of G. polyphemus: (27/29.5)^3*5500';

data.Ri  = 5.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'AverChri2018';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean clutch size 5.2 eggs/clutch, 1 clutch per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (d), mid-line carapace lengths (cm)
8.715	13.691
9.900	14.718
11.779	16.634
12.172	16.360
12.875	20.469
13.655	17.865
13.853	18.276
14.347	18.618
15.335	19.713
17.802	20.670
18.887	21.285
19.193	24.367
19.583	23.202
20.169	21.490
20.172	22.449
20.762	22.106
20.956	21.284
21.467	26.626
21.650	22.447
22.636	22.652
22.739	24.022
22.929	21.830
23.520	21.898
23.528	24.227
24.113	22.582
26.874	23.128
27.268	23.127
27.868	25.798
27.960	24.017
28.056	23.264
28.646	22.784
29.732	23.468
30.424	24.221
30.622	24.494
30.623	24.768
31.118	25.453
31.703	23.535
31.997	23.192
32.393	23.876
34.073	25.382
35.061	26.066
35.544	23.120
35.549	24.696
37.518	24.283
37.522	25.379
39.198	25.857
40.376	24.555
41.072	26.609
41.359	23.869
42.247	24.347
44.222	25.647
45.898	25.920
47.084	27.083
47.483	28.590
48.062	24.890
50.135	26.259
79.697	27.809];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mid-line carapace lengths', 'female'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Brid2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), mid-line carapace lengths (cm)
3.373	7.120
3.568	6.435
5.354	10.406
5.356	10.886
8.122	13.144
9.009	13.212
9.109	13.622
9.502	13.554
9.896	13.279
10.491	14.717
12.960	16.496
14.048	17.591
15.232	18.275
16.320	19.644
17.796	18.889
18.491	20.601
18.588	20.190
19.671	19.778
19.674	20.805
20.658	20.530
23.341	27.309
24.510	23.335
25.787	22.101
27.273	24.771
27.373	25.114
27.859	23.195
28.060	24.291
29.240	23.605
30.226	24.015
30.525	24.974
33.581	25.382
34.078	26.957
34.268	24.560
36.935	26.818
39.985	25.651
41.263	24.622
42.255	26.608
44.913	26.058
45.108	25.441
45.408	26.674
45.803	26.947
46.587	25.919
46.591	27.015
47.273	24.549
47.672	26.261
47.772	26.535
48.462	26.876
48.955	27.013
49.444	25.643
63.438	27.001
72.604	27.883];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mid-line carapace lengths', 'male'};  
temp.tL_m    = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Brid2012';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 2 * weights.psd.p_M;

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
D1 = 'Males are assumed not to differ from females';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1,'D2', D2,'D3', D3);

%% Links
metaData.links.id_CoL = ''; % Cat of Life
metaData.links.id_ITIS = '949462'; % ITIS
metaData.links.id_EoL = '20740311'; % Ency of Life
metaData.links.id_Wiki = 'Gopherus_morafkai'; % Wikipedia
metaData.links.id_ADW = 'Xerobates_agassizii'; % ADW
metaData.links.id_Taxo = '2740380'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gopherus&species=morafkai'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


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
bibkey = 'AverChri2018'; type = 'Article'; bib = [ ... 
'author = {Roy C. Averill-Murray and Terry E. Christopher and Brian T. Henen}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive Ecology and Life History of Female {S}onoran Desert Tortoises (\emph{Gopherus morafkai})}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {32}, ' ...
'number = {1}, ' ...
'pages = {34-50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brid2012'; type = 'PhDthesis'; bib = [ ...  
'author = {Andrew Bridges}, ' ...
'year = {2012}, ' ...
'title  = {Sonoran Desert Tortoise (\emph{Gopherus morafkai}) Growth and Juvenile Habitat Selection at a Long-term Study Site in Central {A}rizona, {U}{S}{A}}, ' ...
'school = {Arizona State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gopherus_agassizii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


