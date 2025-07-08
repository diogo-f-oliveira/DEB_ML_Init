function [data, auxData, metaData, txtData, weights] = mydata_Bison_bison

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bison_bison'; 
metaData.species_en = 'American bison'; 

metaData.ecoCode.climate = {'BS', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 274;  units.tg = 'd';    label.tg = 'gestation time for female calves';    bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 259;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(38.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 33.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';      bibkey.Wwb = 'ADW';
data.Wwbm = 25e3;  units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';      bibkey.Wwbm = 'ADW';
data.Wwi = 500e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '360 to 544 kg';
data.Wwim = 900e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';
  comment.Wwim = '460 to 988 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW_fO = [ ... % time (yr), wet weight (kg)
0.480	197.769
1.479	336.327
2.478	456.565
3.495	472.988
4.450	507.723
5.529	516.012
6.505	516.144
7.501	524.422
8.455	534.730
9.513	526.731
10.489	541.112
11.506	553.464
12.501	533.243
13.498	567.984
14.514	555.908];
data.tW_fO(:,1) = (data.tW_fO(:,1) - 0.48) * 365; % convert yr to d
data.tW_fO(:,2) = data.tW_fO(:,2) * 1e3; % convert kg to g
units.tW_fO   = {'d', 'g'};  label.tW_fO = {'time', 'wet weight', 'female, Ordway'};  
temp.tW_fO    = C2K(38.7);  units.temp.tW_fO = 'K'; label.temp.tW_fO = 'temperature';
bibkey.tW_fO = 'wildplantspost';
comment.tW_fO = 'Data for females in Ordway';
%
data.tW_fK = [ ... % time (yr), wet weight (kg)
0.478	134.665
1.518	242.694
2.517	346.646
3.493	393.598
4.469	422.229
5.486	434.581
6.544	448.974
7.519	449.107
8.495	459.417
9.490	451.410
10.486	447.474
11.483	465.929
12.499	459.960
13.516	464.170
14.532	466.343];
data.tW_fK(:,1) = (data.tW_fK(:,1) - 0.478) * 365; % convert yr to d
data.tW_fK(:,2) = data.tW_fK(:,2) * 1e3; % convert kg to g
units.tW_fK   = {'d', 'g'};  label.tW_fK = {'time', 'wet weight', 'female, Konza'};  
temp.tW_fK    = C2K(38.7);  units.temp.tW_fK = 'K'; label.temp.tW_fK = 'temperature';
bibkey.tW_fK = 'wildplantspost';
comment.tW_fK = 'Data for females in Konza';
%
data.tW_mO = [ ... % time (yr), wet weight (g)
0.459	205.909
1.459	366.859
2.501	519.672
3.459	672.474
4.497	709.256
5.538	855.962
6.534	864.240
7.509	864.372
8.485	870.612];
data.tW_mO(:,1) = (data.tW_mO(:,1) - 0.459) * 365; % convert yr to d
data.tW_mO(:,2) = data.tW_mO(:,2) * 1e3; % convert kg to g
units.tW_mO   = {'d', 'g'};  label.tW_mO = {'time', 'wet weight', 'male, Ordway'};  
temp.tW_mO    = C2K(38.7);  units.temp.tW_mO = 'K'; label.temp.tW_mO = 'temperature';
bibkey.tW_mO = 'wildplantspost';
comment.tW_mO = 'Data for males in Ordway';
%
data.tW_mK = [ ... % time (yr), wet weight (g)
0.458	144.840
1.498	271.190
2.497	389.392
3.476	542.196
4.474	621.721
5.492	686.999
6.510	723.779
7.506	736.128
8.523	752.551];
data.tW_mK(:,1) = (data.tW_mK(:,1) - 0.458)* 365; % convert yr to d
data.tW_mK(:,2) = data.tW_mK(:,2) * 1e3; % convert kg to g
units.tW_mK   = {'d', 'g'};  label.tW_mK = {'time', 'wet weight', 'male, Konza'};  
temp.tW_mK    = C2K(38.7);  units.temp.tW_mK = 'K'; label.temp.tW_mK = 'temperature';
bibkey.tW_mK = 'wildplantspost';
comment.tW_mK = 'Data for males in Konza';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_fO','tW_fK','tW_mO','tW_mK'}; subtitle1 = {'Data for females (Ordway, Konza) and males (Ordway, Konza)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'LWY6'; % Cat of Life
metaData.links.id_ITIS = '180706'; % ITIS
metaData.links.id_EoL = '328109'; % Ency of Life
metaData.links.id_Wiki = 'Bison_bison'; % Wikipedia
metaData.links.id_ADW = 'Bison_bison'; % ADW
metaData.links.id_Taxo = '68224'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200669'; % MSW3
metaData.links.id_AnAge = 'Bison_bison'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bison_bison}}';
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
bibkey = 'wildplantspost'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wildplantspost.blogspot.com/2010/09/bison-growth-curves.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bison_bison}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bison_bison/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

