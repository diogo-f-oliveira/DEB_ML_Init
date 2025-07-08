function [data, auxData, metaData, txtData, weights] = mydata_Macropus_fuliginosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Macropodidae';
metaData.species    = 'Macropus_fuliginosus'; 
metaData.species_en = 'Western grey kangaroo'; 

metaData.ecoCode.climate = {'BSh', 'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'; 'pL'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jessica Ridenour'};    
metaData.date_subm = [2013 04 22];              
metaData.email    = {'jessroberts09@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 11 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 11];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 35.6;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg = 'PoolPilt1964';   
  temp.tg = C2K(36.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 320;      units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'PoolCarp1982';   
  temp.tx = C2K(36.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'permanent pouch exit for eastern grey kangaroos at 319 days +/- 18 days';
data.tp = 670;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PoolCatl1974';
  temp.tp = C2K(36.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'earliest all teats are everted in fuliginousus (429-949)';
data.tpm = 880;      units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23.2*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'Robe1986';   
  temp.am = C2K(36.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.83433; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Pool1975';
data.Wwx = 6500;    units.Wwx = 'g';   label.Wwx = 'wet weight at weaning'; bibkey.Wwx = 'Pool1975';
data.Wwp = 16500;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'ArnoGras1991';
data.Wwi = 35400;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'PoolCarp1982';

data.Ri  = 0.002739726;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'PoolPilt1964';   
  temp.Ri = C2K(36.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
data.pL  = .1*2.08e7*data.Wwi/1000*data.Ri; units.pL  = 'J/d'; label.pL  = 'average yearly milk production'; bibkey.pL  = 'CorkDove1989';   
  temp.pL = C2K(36.3);  units.temp.pL = 'K'; label.temp.pL = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (kg)
0.865	6.497
0.885	8.543
0.936	7.596
1.078	12.156
1.078	9.400
1.088	9.951
1.088	8.691
1.098	13.100
1.098	11.210
1.108	13.887
1.200	13.096
1.200	11.993
1.311	15.925
1.484	15.917
1.800	17.872
1.881	21.018
1.920	25.819
1.932	19.047
1.973	20.226
1.982	22.824
1.983	21.013
1.992	25.028
2.003	22.115
2.003	19.044
2.105	18.015
2.157	15.966
2.175	24.863
2.176	20.926
2.197	19.980
2.277	24.071
2.390	22.963
2.392	11.073
2.694	29.879
3.084	17.893
3.101	31.042
3.184	24.975
4.088	39.816
4.414	38.778
4.619	33.729
5.177	46.932
6.603	46.553];
data.tWw_f(:,1) = 365 * data.tWw_f(:,1); % convert yr to d
data.tWw_f(:,2) = 1e3 * data.tWw_f(:,2); % convert kg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f  = 'ChinWarb2020';
comment.tWw_f = 'Data for females';
% 
data.tWw_m = [ ... % time since birth (yr), wet weight (kg)
1.282	11.124
1.283	12.264
1.294	6.349
1.320	6.837
1.466	8.682
1.492	7.380
1.492	7.977
1.507	13.078
1.558	10.256
1.599	12.101
1.600	16.008
1.690	9.713
1.902	12.915
1.969	15.953
1.983	17.147
2.181	18.070
2.194	19.155
2.366	19.101
2.391	15.953
2.391	18.016
2.393	21.000
2.515	30.116
2.563	19.969
2.604	22.194
2.616	19.047
2.682	21.109
2.761	19.047
2.775	22.140
2.973	24.147
3.068	31.256
3.080	27.023
3.091	22.194
3.184	23.225
3.291	27.186
3.394	20.946
3.486	20.078
3.659	25.884
3.712	27.186
3.817	24.039
3.975	23.822
4.096	31.202
4.108	27.078
4.186	25.070
4.318	26.969
4.358	27.946
4.397	25.070
4.409	23.930
4.517	29.140
4.595	27.132
4.715	30.062
4.872	26.915
4.980	33.264
5.084	30.008
5.097	31.147
5.255	29.140
5.294	28.054
5.491	27.023
5.874	29.031
6.019	30.225
6.192	34.132
6.295	27.078
6.613	32.016
6.981	30.116
7.098	26.969
7.165	30.116
7.508	30.225
7.787	35.054
9.605	36.085];
data.tWw_m(:,1) = 365 * data.tWw_m(:,1); % convert yr to d
data.tWw_m(:,2) = 1e3 * data.tWw_m(:,2); % convert kg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m  = 'ChinWarb2020';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};
  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp, kap_RL, kap_Lm only';
D2 = 'thermoneutral zone, assume to be the same as for reds because the field pouch data was exactly equal. For reds: DawsBlan2000';
D3 = '90 percent of milk production originates from upregulation';
D4 = 'mod_2: males are assumed to differ from femals by {p_Am} and E_Hp only';
D5 = 'mod_2: t-Ww and tpm data added';
D6 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Links
metaData.links.id_CoL = '7VR58'; % Cat of Life
metaData.links.id_ITIS = '552732'; % ITIS
metaData.links.id_EoL = '351020'; % Ency of Life
metaData.links.id_Wiki = 'Macropus_fuliginosus'; % Wikipedia
metaData.links.id_ADW = 'Macropus_fuliginosus'; % ADW
metaData.links.id_Taxo = '168618'; % Taxonomicon
metaData.links.id_MSW3 = '11000251'; % Mammal Spec World
metaData.links.id_AnAge = 'Macropus_fuliginosus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macropus_fuliginosus}}';
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
bibkey = 'CorkDove1989'; type = 'Article'; bib = [ ... 
'author = {Cork, S. J. and Dove, H.}, ' ... 
'year = {1989}, ' ...
'title = {Lactation in the tammar wallaby (\emph{Mucropus eugenii}). II. {I}ntake of milk components and maternal allocation of energy}, ' ...
'journal = {Journal of Zoology, London}, ' ...
'volume = {219}, ' ...
'pages = {399--409}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsDenn1969'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Denny, M. J. S. and Hulbert, A. J.}, ' ... 
'year = {1969}, ' ...
'title = {Thermal balance of the macropod marsupial \emph{Macropus eugenii} {D}esmarest}, ' ...
'journal = {Comparative Biochemistry and Physiology}, ' ...
'volume = {31}, ' ...
'pages = {645--653}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsBlan2000'; type = 'Article'; bib = [ ... 
'author = {Dawson, T. J. and Blaney, C. E. and Munn, A. J. and Krockenberger, A. and Maloney, S. K.}, ' ... 
'year = {2000}, ' ...
'title = {Thermoregulation by kangaroos from mesic and arid habitats: {I}nfluence of temperature on routes of heat loss in eastern grey kangaroos (\emph{Macropus giganteus}) and red kangaroos (\emph{Macropus rufus})}, ' ...
'journal = {Physiological and Biochemical Zoology}, ' ...
'volume = {73}, ' ...
'pages = {374--381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robe1986'; type = 'Article'; bib = [ ... 
'author = {Robertson, G.}, ' ... 
'year = {1986}, ' ...
'title = {The mortality of kangaroos in drought}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {13}, ' ...
'pages = {349--354}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolCatl1974'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Catling, P. C.}, ' ... 
'year = {1974}, ' ...
'title = {Reproduction in the two species of grey kangaroos, \emph{Macropus giganteus} {S}haw and \emph{M. fuliginosus} ({D}esmarest) I. {G}estation, parturition and pouch life}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {22}, ' ...
'number = {}, '...
'pages = {277-302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolCarp1982'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Carpenter, S. M. and Wood, J. T.}, ' ... 
'year = {1982}, ' ...
'title = {Growth of grey kangaroos and the reliability of age determination from body measurements,  II. {T}he western grey kangaroos, \emph{Macropus fuliginosus fuliginosus}, \emph{M. f. melanops} and \emph{M. f. ocydromus}}, ' ...
'journal = {Australian Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {203--212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pool1975'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E.}, ' ... 
'year = {1975}, ' ...
'title = {Reproduction in the two species of grey kangaroos, \emph{Macropus giganteus} {S}haw and \emph{M. fuliginosus} ({D}esmarest) II. {G}estation, parturition and pouch life}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {23}, ' ...
'pages = {333--353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PoolPilt1964'; type = 'Article'; bib = [ ... 
'author = {Poole, W. E. and Pilton, P. E.}, ' ... 
'year = {1964}, ' ...
'title = {Reproduction in the grey kangaroo, \emph{Macropus canguru}, in captivity}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {9}, ' ...
'pages = {218--234}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ArnoGras1991'; type = 'Article'; bib = [ ... 
'author = {Arnold, G. W. and Grassia, A. and Steven, D. E. and Weeldenburg, J. R.}, ' ... 
'year = {1991}, ' ...
'title = {Population ecology of western grey kangaroos in a remnant of wandoo woodland at {B}akers {H}ill, southern {W}estern {A}ustralia}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {18}, ' ...
'pages = {561--575}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChinWarb2020'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.zool.2020.125860}, ' ...
'author = {Chinsamy, A. and Warburton, N. M.}, ' ... 
'year = {2020}, ' ...
'title = {Ontogenetic growth and the development of a unique fibrocartilage entheses in Macropus fuliginosus}, ' ...
'journal = {Zoology}, ' ...
'volume = {18}, ' ...
'pages = {125860}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macropus_fuliginosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

