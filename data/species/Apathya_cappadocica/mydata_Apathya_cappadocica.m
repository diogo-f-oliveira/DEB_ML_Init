function [data, auxData, metaData, txtData, weights] = mydata_Apathya_cappadocica

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Lacertidae';
metaData.species    = 'Apathya_cappadocica';
metaData.species_en = 'Anatolian lizard';

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data;
data.ab = 3*30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'GulOzem2015';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.2;     units.Lb  = 'cm';  label.Lb  = 'SVL';   bibkey.Lb  = 'guess';
data.Li  = 7.11; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'GulOzem2015';
data.Lim = 8.35; units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'GulOzem2015';

data.Wwb = 1.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
data.Wwi = 14.6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 54*(7.11/11)^3';
data.Wwim = 23.6; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on 54*(8.35/11)^3';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';
temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr(, SVL (cm)
4.000	6.057
4.000	6.093
4.000	6.171
4.992	6.260
4.997	6.590
4.997	6.536
4.997	6.320
5.002	5.757
6.003	6.308
6.003	7.105
7.000	7.081];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GulOzem2015'; 
%
data.tL_m = [... % time since birth (yr(, SVL (cm)
4.000	6.584
4.000	6.584
4.997	6.404
5.007	7.769
5.007	7.757
5.012	7.087
5.012	6.542
6.003	7.949
6.003	8.326];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GulOzem2015'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'F8SX'; % Cat of Life
metaData.links.id_ITIS = '1155316'; % ITIS
metaData.links.id_EoL = '791759'; % Ency of Life
metaData.links.id_Wiki = 'Apathya_cappadocica'; % Wikipedia
metaData.links.id_ADW = 'Apathya_cappadocica'; % ADW
metaData.links.id_Taxo = '1685249'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Apathya&species=cappadocica'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apathya_cappadocica}}';   
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
bibkey = 'GulOzem2015'; type = 'Article'; bib = [ ...  
'doi = {10.3906/zoo-1407-6}, ' ...
'author = {Serkan G\"{u}l and Nurhayat \"{O}zem\''{i}r and Aziz Avci and Yusuf Kumluta\c{s} and \c{C}etin Ilgaz}, ' ...
'title = {Altitudinal effects on the life history of the {A}natolian lizard (\emph{Apathya cappadocica}, {W}erner 1902) from southeastern {A}natolia, {T}urkey}, ' ...
'journal = {Turk J Zool.}, ' ...
'volume = {39}, ' ...
'pages = {507-512}, ' ...
'year = {2015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

