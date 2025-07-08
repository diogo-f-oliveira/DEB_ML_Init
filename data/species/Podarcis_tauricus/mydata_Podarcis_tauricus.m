function [data, auxData, metaData, txtData, weights] = mydata_Podarcis_tauricus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Podarcis_tauricus'; 
metaData.species_en = 'Balkan wall lizard'; 

metaData.ecoCode.climate = {'Csa', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 12];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2.5*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'ErogBulb2017';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ErogBulb2017';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.7;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'ErogBulb2017';  
data.Li  = 7.05;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'ErogBulb2017'; 
data.Lim  = 7.93;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'ErogBulb2017'; 

data.Wwi = 6.90;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Podarcis muralis: 5.41*(7.05/6.5)^3';

data.Ri  = 2*7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-10 eggs per clutch, 2 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm): females, males
 0	2.708 2.708
 4	5.756 NaN
 5	6.153 NaN
 5	6.058 NaN
 5	5.834 NaN
 5	6.359 NaN
 5	5.112 5.542
 6  NaN   6.472
 6	6.128 5.947
 6	6.343 6.601
 6	6.025 5.827
 6	6.670 6.721
 7	6.008 NaN
 7	5.939 6.438
 7	6.077 6.266
 8  NaN   6.542
 8	6.723 6.241
 8	6.362 6.043
 8	5.699 5.846
 9  NaN   6.535
 9  NaN   6.122 
 9  NaN   6.337
10	6.647 6.854];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ErogBulb2017'; treat.tL = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4KPJF'; % Cat of Life
metaData.links.id_ITIS = '1155412'; % ITIS
metaData.links.id_EoL = '791002'; % Ency of Life
metaData.links.id_Wiki = 'Podarcis_tauricus'; % Wikipedia
metaData.links.id_ADW = 'Podarcis_tauricus'; % ADW
metaData.links.id_Taxo = '1685287'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Podarcis&species=tauricus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podarcis_tauricus}}';
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
bibkey = 'ErogBulb2017'; type = 'Article'; bib = [ ...
'doi = {10.1163/15707563-17000019}, ' ...
'author = {Ali I. Erol\v{g}u and Ufuk B\"{u}lb\"{u}l and Muammer Kurnaz}, ' ... 
'year = {2017}, ' ...
'title = {Age structure and growth in a {T}urkish population of the Crimean Wall Lizard, \emph{Podarcis tauricus} ({P}aLLas, 1814) ({S}quamata: {S}auria: {L}acertidae)}, ' ...
'jpurnal = {Herpetozoa}, ' ...
'volume = {29(3/4)}, ' ...
'pages = {125-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

