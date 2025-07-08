function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_dussumieri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_dussumieri'; 
metaData.species_en = 'Whitecheek shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 15];

%% set data
% zero-variate data

data.ab = 8*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(16.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'RaesKamr2017';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 34.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Asad2001';  
  comment.Lb = '34.5 to 49 cm';
data.Lp  = 69;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Asad2001'; 
data.Lpm  = 67;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Asad2001'; 
data.Li  = 121;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 110;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';
  comment.Lim = 'based on tL_fm data';

data.Wwi = 8.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','WhitHall2002'};
  comment.Wwi = 'based on 0.00324*Li^3.09, see F1';
data.Wwim = 6.58e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = {'fishbase','WhitHall2002'};
  comment.Wwim = 'based on 0.00324*Lim^3.09, see F1';

data.Ri  = 2/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Asad2001';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-5 per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 0	 30.312  34.141
 1	 45.709  48.137
 2	 62.207  64.581
 3	 77.049  79.070
 4	 88.581  91.109
 5	 97.913  99.261
 6	103.939 104.486
 7	109.412 106.779
 8	112.127 108.092
 9	115.394 NaN
10	115.355 NaN
11	116.970 NaN
12	118.584 NaN
13	118.545 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(27.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'RaesKamr2017'; treat.tL_fm = {1 {'females','males'}};
comment.tL_fm = 'Data digitized from drawn curve, not original data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} ans E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww on g = 0.00324*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'R3NB'; % Cat of Life
metaData.links.id_ITIS = '160375'; % ITIS
metaData.links.id_EoL = '46559798'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_dussumieri'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_dussumieri'; % ADW
metaData.links.id_Taxo = '106447'; % Taxonomicon
metaData.links.id_WoRMS = '217347'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-dussumieri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_dussumieri}}';
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
bibkey = 'RaesKamr2017'; type = 'Article'; bib = [ ... 
'doi = {10.4194/1303-2712-v17_2_14}, ' ...
'author = {Hadi Raeisi and Ehsan Kamrani and Carl Walter and Rahman Patimar and Iman Sourinejad}, ' ... 
'year = {2017}, ' ...
'title = {Growth and Maturity of \emph{Carcharhinus dussumieri} ({M}uller and {H}ellen, 1839) in the {P}ersian {G}ulf and {O}man {S}ea}, ' ...
'journal = {Turkish Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {17}, ' ...
'pages = {353-361}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Asad2001'; type = 'Article'; bib = [ ... 
'doi = {10.4194/1303-2712-v17_2_14}, ' ...
'author = {Asadi, H.}, ' ... 
'year = {2001}, ' ...
'title = {Some aspects of reproduction biology of white Cheek Shark (\emph{Carcharhinus dussumieri}) in {H}ormozgan {W}aters ({O}man {S}ea)}, ' ...
'journal = {Iranian Journal of Fisheries Science}, ' ...
'volume = {1}, ' ...
'pages = {1-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Carcharhinus-dussumieri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

