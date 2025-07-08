function [data, auxData, metaData, txtData, weights] = mydata_Penthetor_lucasi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Penthetor_lucasi'; 
metaData.species_en = 'Dusky fruit bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 28]; 

%% set data
% zero-variate data

data.tg = 95;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Kofr2007';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
data.tx = 4.5*31;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Kofr2007';
  comment.Wwb = 'based on interpolation in tWw data';
data.Wwi = 38.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EoL';

data.Ri  = 1.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw_e = [ ... % age (d), embryo wet weight (g)
25.218	2.845
62.985	10.948
63.881	4.224
70.100	10.345
90.614	11.121
91.424	9.828];
units.tWw_e   = {'d', 'g'};  label.tWw_e = {'age', 'wet weight', 'embryo'};  
temp.tWw_e    = C2K(34.8);  units.temp.tWw_e = 'C'; label.temp.tWw_e = 'temperature';
bibkey.tWw_e = 'Kofr2007';
comment.tWw_e = 'Data for embryos';
%
data.tWw_f = [ ... % time since birth (d), forearm length (cm)
110.986	20.862
133.074	21.983
180+2.640	36.984
180+18.896	32.677
180+19.647	36.298
180+30.212	33.542
180+31.909	28.715
180+107.852	36.922
180+116.047	30.631];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'age', 'wet weight', 'female'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'C'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Kofr2007';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), forearm length (cm)
105.495	18.621
170.985	20.948
180+2.565	41.639
180+35.093	31.991
180+62.508	38.291
180+70.577	39.758
180+73.981	29.500
180+103.839	34.852
180+106.395	26.922
180+107.091	33.905];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'age', 'wet weight', 'male'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'C'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Kofr2007';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m','tWw_e'}; subtitle1 = {'Data for females, males, embryos'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '76PRP'; % Cat of Life
metaData.links.id_ITIS = '1145678'; % ITIS
metaData.links.id_EoL = '323413'; % Ency of Life
metaData.links.id_Wiki = 'Penthetor_lucasi'; % Wikipedia
metaData.links.id_ADW = 'Penthetor_lucasi'; % ADW
metaData.links.id_Taxo = '63794'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800227'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Penthetor_lucasi}}';
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
bibkey = 'Kofr2007'; type = 'Article'; bib = [ ...
'doi = {10.1515/mamm.2007.031}, ' ...
'author = {Kofron, C. P.}, ' ... 
'year = {2007}, ' ...
'title =  {Reproduction of the dusky fruit bat \emph{Penthetor lucasi} ({P}teropodidae) in {B}runei, {B}orneo}, ' ...
'journal = {Mammalia}, ' ...
'volume = {71(4)}, ' ...
'pages = {166–171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/323413}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

