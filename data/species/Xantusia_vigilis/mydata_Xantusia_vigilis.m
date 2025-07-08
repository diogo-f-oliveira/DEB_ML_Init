function [data, auxData, metaData, txtData, weights] = mydata_Xantusia_vigilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Xantusiidae';
metaData.species    = 'Xantusia_vigilis'; 
metaData.species_en = 'Desert night lizard'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 28];

%% set data
% zero-variate data

data.ab = 90;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ZweiLowe1966';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.25;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Wiki';  
data.Lp  = 3.85;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';  bibkey.Lp  = 'ZweiLowe1966';  
data.Lpm  = 3.6;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'ZweiLowe1966';  
data.Li  = 5.0;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'ZweiLowe1966';  
data.Lim = 4.4;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'ZweiLowe1966';  

data.Wwb = 0.23;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Wiki';
data.Wwp = 0.95; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'ZweiLowe1966';
data.Wwpm = 0.7; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'ZweiLowe1966';
data.Wwi = 1.3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 1.1;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Wiki';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 young per clutch, 1 clutch per yr assumed';
  
% univariate data
% time-length
data.tL = [ ... % time since borth (yr), SVL (cm)
0	2.304 2.304
1	2.947 2.947
2	3.521 3.521
3	3.859 3.859
4	4.089 3.913
5	4.246 3.961
6	4.388 4.034
7	4.490 4.093
8	4.588 4.151
9	4.740 4.190];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'}; 
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZweiLowe1966'; treat.tL = {1, {'female','males'}};
comment.tL = 'Temperature oscillates between 7 and 27 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 5 * weights.Ri;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'scaled functional response seems to increase slightly with age';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5C8PB'; % Cat of Life
metaData.links.id_ITIS = '174092'; % ITIS
metaData.links.id_EoL = '793549'; % Ency of Life
metaData.links.id_Wiki = 'Xantusia_vigilis'; % Wikipedia
metaData.links.id_ADW = 'Xantusia_vigilis'; % ADW
metaData.links.id_Taxo = '49311'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Xantusia&species=vigilis'; % ReptileDB
metaData.links.id_AnAge = 'Xantusia_vigilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xantusia_vigilis}}';
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
bibkey = 'ZweiLowe1966'; type = 'article'; bib = [ ... 
'author = {Richard G. Zweifel and Charles H. Lowe}, ' ... 
'year = {1966}, ' ...
'title = {The Ecology of a Population of \emph{Xantusia vzgilis}, the Desert Night Lizard}, ' ...
'journal = {American Museum Novitates}, ' ...
'volume = {2247}}, ' ...
'pages = {1-57}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Xantusia_vigilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
