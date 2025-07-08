function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_intermedius
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Crocodylus_intermedius'; 
metaData.species_en = 'Orinico crocodile'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 17];              
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

data.tp = 6*365;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Seij2016';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 75*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 41 yr';

data.Lb  = 23.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ReptileDB'; 
 comment.Lb = '22-25 cm';
data.Lp  = 250;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Seij2016'; 
data.Lpm  = 250;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Seij2016'; 
data.Li  = 344;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'ReptileDB';
  comment.Li = 'based on (Wwi/Wwim)^(1/3)*Lim';
data.Lim  = 410;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';
  comment.Lim = 'ReptileDB gives upto 678 cm';

data.Wwi = 225e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
data.Wwim = 380e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 40/365/2;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '40 eggs per clutch, 1 clutch per 2yrs assumed';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yrs), total length
0.629	70.858
1.432	94.524
1.519	83.109
1.586	86.160
1.633	105.199
1.656	118.145
1.657	128.805
1.767	112.823
1.807	69.425
1.832	99.123
1.852	80.089
1.942	89.233
1.945	121.212
1.949	160.807
1.966	107.508
2.014	137.969
2.122	114.373
2.522	115.165
2.606	58.826
2.607	69.486
2.743	97.669
2.766	110.615
2.977	220.276
3.054	96.170
3.637	149.514
3.655	106.876
3.678	116.776
3.993	158.678
4.017	173.147
4.351	174.695
4.593	157.962
4.735	243.252
4.738	269.902
4.799	212.039
5.687	209.061
5.938	273.039
5.939	284.461
5.977	215.936
6.042	201.474
6.584	284.510
6.847	247.982
9.700	339.569
9.743	319.776
10.495	290.899
12.719	303.251];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f  = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Seij2016';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yrs), total length
2.546	123.542
2.835	130.417
3.640	178.448
3.901	119.838
3.929	177.709
4.620	202.127
4.666	219.643
4.731	202.135
4.780	245.540
4.793	152.648
4.817	167.116
4.886	190.726
4.928	171.693
5.756	231.909
5.896	295.117
9.065	204.749
10.155	217.777
11.792	369.424
12.103	370.971
20.039	389.849];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m  = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Seij2016';
comment.tL_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKND'; % Cat of Life
metaData.links.id_ITIS = '202201'; % ITIS
metaData.links.id_EoL = '795281'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_intermedius'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_intermedius'; % ADW
metaData.links.id_Taxo = '50630'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=intermedius'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_intermedius'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_intermedius}}';
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
bibkey = 'Seij2016'; type = 'Article'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Andr\''{e}s E. Seijas Y.}, ' ...
'year = {2016}, ' ...
'title  = {Regional differences in growth rates of {O}rinoco crocodiles (\emph{Crocodylus intermedius}) from the {V}enezuelan {L}lanos}, ' ...
'journal = {Herpetological Journal}, ' ...
'pages = {263–269}, ' ...
'volume = {26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Crocodylus&species=intermedius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
