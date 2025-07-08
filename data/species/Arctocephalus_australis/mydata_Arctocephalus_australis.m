function [data, auxData, metaData, txtData, weights] = mydata_Arctocephalus_australis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Arctocephalus_australis'; 
metaData.species_en = 'South American fur seal'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE', 'MASW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 23]; 

%% set data
% zero-variate data

data.tg = 236;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp for Zalophus_californianus';
data.tx = 411;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 2556;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 64;   units.Lb  = 'cm';  label.Lb  = 'length at birth';                    bibkey.Lb  = 'ADW';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'ADW';
data.Lim  = 190;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'ADW';
  
data.Wwb = 4250; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 50e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'ADW';
data.Wwim = 200e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'ADW';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data for female
data.tL_f = [ ... % time since birth (yr), length (cm)
0.514	87.221
1.405	98.833
2.491	104.362
3.511	112.721
4.478	116.834
5.510	119.249
6.599	123.222
7.450	124.928
8.484	125.928
9.396	127.352
10.428	129.343
11.417	122.984
12.382	127.946
13.296	128.521
14.394	128.248
15.302	131.653
16.339	131.521
17.383	127.569
18.356	128.851
19.385	132.823
20.373	126.606
21.352	124.917
22.379	129.455
23.357	128.333
26.472	126.098
28.406	134.465];
data.tL_f(:,1) = data.tL_f(:,1) * 365.25; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length'};  
temp.tL_f    = C2K(38.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LimaPaez1995';
comment.tL_f = 'Data for females';
% t-W data 
data.tW_f = [ ... % time since birth (yr), weight (kg)
0.015	4.203
0.040	6.085
0.433	15.381
1.452	20.702
2.478	24.364
3.373	30.236
4.342	32.460
5.371	35.126
6.406	36.133
7.372	39.241
8.409	39.805
9.389	39.042
10.415	42.593
11.345	38.953
12.376	41.066
13.225	42.735
14.330	41.309
15.306	41.762
16.275	44.207
17.318	43.001
18.293	43.565
19.332	43.466
21.438	35.857
23.364	43.732
26.486	42.107
28.506	41.023];
data.tW_f(:,1) = data.tW_f(:,1) * 365.25; % convert yr to d
units.tW_f   = {'d', 'kg'};  label.tW_f = {'time since birth', 'weight'};  
temp.tW_f    = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LimaPaez1995';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5VS33'; % Cat of Life
metaData.links.id_ITIS = '180633'; % ITIS
metaData.links.id_EoL = '46559198'; % Ency of Life
metaData.links.id_Wiki = 'Arctocephalus_australis'; % Wikipedia
metaData.links.id_ADW = 'Arctocephalus_australis'; % ADW
metaData.links.id_Taxo = '67382'; % Taxonomicon
metaData.links.id_WoRMS = '231435'; % WoRMS
metaData.links.id_MSW3 = '14000998'; % MSW3
metaData.links.id_AnAge = 'Arctocephalus_australis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctocephalus_australis}}';
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
bibkey = 'LimaPaez1995'; type = 'Article'; bib = [ ... 
'author = {Lima, M. and Paez, E.}, ' ... 
'year = {1995}, ' ...
'title = {Growth and reproduction patterns in the {S}outh {A}merican fur seal}, ' ...
'journal = {J. Mammol.}, ' ...
'volume = {76}, ' ...
'pages = {1249--1255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Arctocephalus_australis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Arctocephalus_australis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


