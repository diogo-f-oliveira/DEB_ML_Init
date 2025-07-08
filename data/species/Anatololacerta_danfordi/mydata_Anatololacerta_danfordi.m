function [data, auxData, metaData, txtData, weights] = mydata_Anatololacerta_danfordi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Anatololacerta_danfordi'; 
metaData.species_en = 'Danford''s lizard'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 04];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '7 till 10 weeks';
data.ap = 22.5*30.5;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'guess';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 13*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BeseIlga2020';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.3;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Gallotia_atlantica: 7/7.3*2.45';
data.Li  = 7;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'BeseIlga2020'; 
  comment.Li = 'based on tL data';

data.Wwi = 6.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Gallotia_atlantica: (7/7.3)^3*7.8';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-8 eggs per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL_S = [ ... % hibernations (#), SVL (cm): females, males
    3 4.366 NaN
    4 4.590 4.858
    5 4.689 NaN
    6 5.354 NaN
    7 5.734 5.783
    8 5.960 6.440
    9 NaN   6.496];
data.tL_S(:,1) = (data.tL_S(:,1)+.7) * 365; % convert yr to d
units.tL_S  = {'d', 'cm'};  label.tL_S = {'time since birth', 'SVL', 'Saimbeyli'};  
temp.tL_S   = C2K(11.7);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'BeseIlga2020'; treat.tL_S = {1, {'females','males'}};
comment.tL_S = 'Data for Saimbeyli, 1200 m elevation, 592 mm precipitation';
%
data.tL_K = [ ... % hibernations (#), SVL (cm)
    5 4.972 4.840
    6 NaN   4.842
    7 5.170 5.234
    8 5.514 5.783
    9 NaN   5.829
   10 6.072 6.147
   11 6.236 6.293
   12 NaN   6.558
   13 NaN   6.806];
data.tL_K(:,1) = (data.tL_K(:,1)+.7) * 365; % convert yr to d
units.tL_K  = {'d', 'cm'};  label.tL_K = {'time since birth', 'SVL', 'Kozan'};  
temp.tL_K   = C2K(14.2);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'BeseIlga2020'; treat.tL_K = {1, {'females','males'}};
comment.tL_K = 'Data for Kozan, 678 m elevation, 620 mm precititation';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '66MLM'; % Cat of Life
metaData.links.id_ITIS = '1155324'; % ITIS
metaData.links.id_EoL = '1056204'; % Ency of Life
metaData.links.id_Wiki = 'Anatololacerta_danfordi'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_danfordi'; % ADW
metaData.links.id_Taxo = '1685247'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anatololacerta&species=danfordi'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anatololacerta_danfordi}}';
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
bibkey = 'BeseIlga2020'; type = 'Article'; bib = [ ...
'doi = {10.3906/zoo-1909-39}, ' ...
'author = {Nurettin Be\c{s}er and \c{C}etin Ilgaz and Yusuf Kumlata\c{s} and Kamil Candan and \"{O}zg\"{u}r G\"{u}\c{c}l\"{u} and Nazan \"{U}z\"{u}m}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth in two populations of {D}anford''s lizard, \emph{Anatololacerta danfordi} ({G}\"{u}nther, 1876), from the eastern {M}editerranean}, ' ...
'journal = {Turkish Journal of Zoology}, ' ...
'volume = {44}, ' ...
'pages = {173-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

