function [data, auxData, metaData, txtData, weights] = mydata_Arctocephalus_philippii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Arctocephalus_philippii'; 
metaData.species_en = 'Juan Fernandez fur seal';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 07]; 

%% set data
% zero-variate data

data.tg = 365;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 220;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'GallFigu2010';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3.5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature for males';
data.tpm = 5*365;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'guess';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 60;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GallFigu2010';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'ADW';
  comment.Li = '110-140 cm';
data.Lim  = 190;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'ADW';
   comment.Lim = '110-140 cm, males being slightly larger than females';
  
data.Wwb = 3500; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GallFigu2010';
data.Wwi = 50000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'ADW';
  comment.Wwi = '55 kg for A.p.townsendi';
data.Wwim = 140000; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'ADW';
  comment.Wwi = '160 kg for A.p.townsendi';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), length (cm)
0.581	71.962
0.946	70.479
0.961	68.008
1.681	66.724
1.689	65.340
1.720	60.200
19.838	67.620
19.844	66.533
19.851	65.347
20.163	72.859
20.169	71.772
20.181	69.795
20.188	68.609
39.766	70.099
40.102	73.559
40.105	72.966
40.111	72.076
40.129	69.012
40.135	67.925
40.196	57.744
40.435	77.513
40.443	76.030
40.451	74.745
40.544	59.029
144.645	100.190
144.685	93.469
145.109	81.904
145.423	89.021
146.205	77.258
219.472	93.301
219.515	86.085
219.538	82.230
220.101	107.337
220.168	95.970
220.175	94.882
220.631	77.980];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(38.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GallFigu2010';
comment.tL = 'Data for pups till weaning from Guadelope: A.p.townsendi';
    
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.032	3854.482
1.070	4532.576
1.077	4933.193
1.428	5487.936
19.264	8540.982
19.920	6907.781
19.920	6907.781
19.928	7370.032
19.930	7493.299
19.939	7986.366
20.596	6445.615
39.808	9961.080
39.826	10978.032
39.903	15477.271
40.134	9005.804
40.142	9498.872
40.158	10423.373
40.175	11409.508
40.185	11964.208
40.220	14028.928
144.546	14997.103
144.649	21067.994
145.162	11021.833
145.195	12994.102
219.040	11462.372
219.418	13527.134
219.443	15006.336
219.477	16978.605
219.741	12417.775
220.170	17533.390];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'GallFigu2010';
comment.tWw = 'Data for pups till weaning from Guadelope: A.p.townsendi';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

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
D2 = 'Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration';
D3 = 'We follow CoL to consider A. townsendi as subspecies of Arctocephalus philippii';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5W433'; % Cat of Life
metaData.links.id_ITIS = '180635'; % ITIS
metaData.links.id_EoL = '46559200'; % Ency of Life
metaData.links.id_Wiki = 'Arctocephalus_philippii'; % Wikipedia
metaData.links.id_ADW = 'Arctocephalus_philippii'; % ADW
metaData.links.id_Taxo = '67391'; % Taxonomicon
metaData.links.id_WoRMS = '255006'; % WoRMS
metaData.links.id_MSW3 = '14001002'; % MSW3
metaData.links.id_AnAge = 'Arctocephalus_philippii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctocephalus_philippii}}';
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
bibkey = 'GallFigu2010'; type = 'Article'; bib = [ ... 
'doi = {10.12933/therya-10-8}, ' ...
'author = {Juan-Pablo Gallo-Reynoso and Ana-Luisa Figueroa-Carranza}, ' ... 
'year = {2010}, ' ...
'title = {PUP GROWTH OF THE {G}UADALUPE FUR SEAL, \emph{Arctocephalus townsendi}}, ' ...
'journal = {Therya}, ' ...
'volume = {1(1)}, ' ...
'pages = {75-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OchoFran1998'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z98-024}, ' ...
'author = {Ochoa-Acu\~{n}a, H. and Francis, J. M. and Boness, D. J.}, ' ... 
'year = {1998}, ' ...
'title = {Interannual variation in birth mass and postnatal growth rate of {J}uan {F}ern\''{a}ndez fur seals}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {76(5)}, ' ...
'pages = {978–983}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OsmaMore2010'; type = 'Article'; bib = [ ... 
'doi = {10.1644/09-MAMM-A-197.1}, ' ...
'author = {Layla P. Osman and Carlos A. Moreno and Andrew W. Trites}, ' ... 
'year = {2010}, ' ...
'title = {Growth rates and differential investment in male and female Juan Fern\''{a}andez fur seal pups}, ' ...
'journal = {journal of Mammalogy}, ' ...
'volume = {91(5)}, ' ...
'pages = {1188–1196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Arctocephalus_philippii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Arctocephalus_philippii/}, \url{https://animaldiversity.org/accounts/https://animaldiversity.org/accounts/Arctocephalus_townsendi//}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


