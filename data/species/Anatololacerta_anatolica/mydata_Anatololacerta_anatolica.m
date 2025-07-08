function [data, auxData, metaData, txtData, weights] = mydata_Anatololacerta_anatolica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Anatololacerta_anatolica'; 
metaData.species_en = 'Anatolian rock lizard'; 

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
metaData.date_subm = [2023 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 04];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'YakiTok2015';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'YakiTok2015';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess';  
data.Li  = 7.4;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'YakiTok2015'; 
data.Lim = 7.6;    units.Lim = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'guess'; 

data.Wwi = 7.98;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Podarcis muralis: 5.41*(7.4/6.5)^3';

data.Ri  = 3.5*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-8 eggs per clutch, assumed: 3-4 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm): females, males
 2	4.904 NaN
 3	5.298 5.476
 3	5.608 5.549
 3	5.846 5.252
 4	5.666 6.055
 4	6.306 NaN
 4	4.867 NaN
 4	4.121 NaN
 4	6.623 NaN
 4	6.405 NaN
 4	5.501 NaN
 5	6.846 6.542
 5	6.800 NaN
 5	6.793 NaN
 5	5.842 NaN
 6	6.970 NaN
 6	6.904 NaN
 6	7.128 NaN
 6	7.055 NaN
 6	7.009 NaN
 6	6.712 NaN
 6	6.666 NaN
 6	6.534 NaN
 7	7.338 NaN
 7	7.265 NaN
 8	7.343 NaN
10	7.418 NaN];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YakiTok2015'; treat.tL = {1, {'females','males'}};

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
metaData.links.id_CoL = '66MLG'; % Cat of Life
metaData.links.id_ITIS = '1155307'; % ITIS
metaData.links.id_EoL = '62510536'; % Ency of Life
metaData.links.id_Wiki = 'Anatololacerta_anatolica'; % Wikipedia
metaData.links.id_ADW = 'Lacerta_anatolica'; % ADW
metaData.links.id_Taxo = '1685246'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Anatololacerta&species=anatolica'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anatololacerta_anatolica}}';
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
bibkey = 'YakiTok2015'; type = 'Article'; bib = [ ...
'doi = {10.3906/zoo-1311-33}, ' ...
'author = {Batuhan Yaman Yakin and Cemal Varol Tok}, ' ... 
'year = {2015}, ' ...
'title = {Age estimation of \emph{Anatololacerta anatolica} ({W}erner, 1902) in the vicinity of \c{C}anakkale by skeletochronology}, ' ...
'jpurnal = {Turk. J. Zool.}, ' ...
'volume = {39}, ' ...
'pages = {66-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

