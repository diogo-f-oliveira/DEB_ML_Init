function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_vollenhovenii

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_vollenhovenii'; % also spelled Macrobrachium_vollenhoveni in Wiki
metaData.species_en = 'African river prawn'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp % mean ambient reservoir water temperature in  EtimSank1998
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1    = {'Nina Marn'};    
metaData.date_mod_1 = [2021 10 12];              
metaData.email_mod_1     = {'nina.marn@gmail.com'};            
metaData.address_mod_1   = {'Rudjer Boskovic Institute, Zagreb, Croatia'};


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 08]; 

%% set data
% zero-variate data

data.aj = 45;  units.aj = 'd';     label.aj = 'age at recruitment';    bibkey.aj = 'EtimSank1998';   
  temp.aj = C2K(28);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = '30-60 days, egg-bearng females spotted Jun-Dec, peak in August; peak in recruitment Sep-Nov (Table 1)';
data.ap = 9*30;  units.ap = 'd';     label.ap = 'age at puberty';    bibkey.ap = 'EtimSank1998';   
  temp.ap = C2K(29);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'at least 9 months implied by earliest recruitment in September and earliest spotting of egg-bearing females in May';
data.am = 2.5*365;  units.am = 'd';     label.am = 'life span';                  bibkey.am = 'EtimSank1998';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '0.9 to 3 yr estimates, but assumed to be 2.5 yr based on EtimSank1998 estimates';
 
data.Lj  = 2.45; units.Lj  = 'cm';   label.Lj  = 'total length at recruitment';  bibkey.Lj  = 'EtimSank1998';
  comment.Lj = 'mean length of smallest class interval in sample, size class = 1cm (Table 1)';
data.Lp  = 8.45; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'EtimSank1998';
  comment.Lp = 'based on length frequency in sample in August when most egg-bearing females found (Table 1 and text)';
data.Li  = 14.45;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'EtimSank1998';
 comment.Li = 'mean length of largest class interval in sample, size class = 1cm (Table 1); also info in Wiki';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 10.25;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on same relative weight, compared to Palaemon elegans (11.25/18)^3*42';
data.Wwi = 42;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on same length-weight, compared to Palaemon elegans (18/5.84)^3*1.43'; 

data.Ri  = 5e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 42/1.43*1704 per yr';
  
% uni-variate data
% time-length data
data.tL = [ ... % time (d),total length (cm)
0 2.45 % Sep - first recruitment in Table 1
30 3.45 % Oct
60 4.45 % Nov
90 5.45 % Dec
120	6.664 % Jan in Fig2 %time was 73.354 d
150	7.542 % was 105.197 d
180	8.162 % was 132.247 d
210	8.369 % was 162.720 d
240	8.576 % 194.221 d
270	8.989 % 224.695 d
300	9.402 % 255.169 d
330	9.092 % 287.355 d
360	9.764 % 318.171 d
390	10.280 % 348.644 d
420	10.952]; % was 379.461 d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; bibkey.tL = 'EtimSank1998';
comment.tL = 'combined information from Table 1 Figure 2'; 


%% set weights for all real data
weights = setweights(data, []);
weights.Lj = 5 * weights.Lj;
weights.tL = 5 * weights.tL;
% weights.ap = 0.5 * weights.ap;
% weights.aj = 2 * weights.aj;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.ap = 0.5 * weights.ap;
weights.aj = 0.5 * weights.aj;



%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Disccussion points
D1 = 'Seasonal temperature variation between 24 and 32 C is assumed: T = 28+4*sin(2*pi*(t+50)/365) C';
D2 = 'Difference to previous version: added data on Lj, aj, ap, Lp, Li; corrected growth curve; added F1' ; 
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = ['M. vollenhoveni occurs in fresh and brackish waters; egg development and hatching happen', ...
    'in estuarine waters (higher salinity), then larvae return to freshwater back upstream into freshwater to complete their development.'];
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9GQGT'; % Cat of Life
metaData.links.id_ITIS = '96372'; % ITIS
metaData.links.id_EoL = '46515424'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_vollenhovenii'; % ADW
metaData.links.id_Taxo = '33830'; % Taxonomicon
metaData.links.id_WoRMS = '240834'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrobrachium}}';
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
bibkey = 'EtimSank1998'; type = 'Article'; bib = [ ...
'author = {Lawrence Etima and Yacouba Sankare}, ' ...
'year = {1998}, ' ...
'title = {Growth and mortality, recruitment and yield of the fresh-water shrimp, \emph{Macrobrachium v\"{o}llenhovenii}, {H}erklots 1851 ({C}rustacea, {P}alaemonidae) in the {F}ahe reservoir, C\^{o}te d''{I}voire, {W}est {A}frica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {38}, ' ...
'pages = {211-223}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

