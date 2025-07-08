function [data, auxData, metaData, txtData, weights] = mydata_Liopsetta_glacialis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Liopsetta_glacialis'; 
metaData.species_en = 'Artic flounder'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 12];

%% set data
% zero-variate data

data.am = 26*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;  units.Lp  = 'cm';  label.Lp  = 'length at puberty for females';  bibkey.Lp  = 'guess';
data.Li  = 44;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter 0.95 mm: 4/3*pi*0.0475^3';
data.Wwp = 19.7;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','fishesoftexas'}; 
  comment.Wwp = 'based on 0.00437*Lp^2.97, see F1';
data.Wwi = 332;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'}; 
  comment.Wwi = 'based on 0.00437*Li^2.97, see F1';
  
data.Ri  = 230000/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of 23e4, each 2 yrs';
 
% uni-variate data
% time-length 
data.tL_Dfm = [... % time since birth (yr), total length (cm)
 2	13.264 11.879
 3	17.223 12.586
 4	18.112 13.206
 5	19.439 14.266
 6	21.380 15.237
 7	22.269 17.173
 8	23.773 16.389
 9	25.275 15.875
10	25.989 NaN
13  NaN    17.473];
data.tL_Dfm(:,1) = 365 * (0 + data.tL_Dfm(:,1)); 
units.tL_Dfm = {'d', 'cm'}; label.tL_Dfm = {'time since birth', 'total length'};  
temp.tL_Dfm = C2K(3); units.temp.tL_Dfm = 'K'; label.temp.tL_Dfm = 'temperature';
bibkey.tL_Dfm = 'SemuFuks2015'; treat.tL_Dfm = {1 {'females','males'}};
comment.tL_Dfm = 'Data from Dvina Bay, White Sea'; title.tL_Dfm = 'Dvina Bay, White Sea';
%
data.tL_Ofm = [... % time since birth (yr), total length (cm)
 1   6.056  7.222
 2	10.367  9.684
 3	14.150 11.620
 4	16.004 12.591
 5	18.472 13.650
 6	20.237 14.358
 7	21.565 14.452
 8	23.331 14.809
 9	23.255 15.254
10	19.582 15.523
11	24.419 15.442
12  NaN    15.711
14  NaN    15.724
15	26.571 16.870];
data.tL_Ofm(:,1) = 365 * (0 + data.tL_Ofm(:,1)); 
units.tL_Ofm = {'d', 'cm'}; label.tL_Ofm = {'time since birth', 'total length'};  
temp.tL_Ofm = C2K(3); units.temp.tL_Ofm = 'K'; label.temp.tL_Ofm = 'temperature';
bibkey.tL_Ofm = 'SemuFuks2015'; treat.tL_Ofm = {1 {'females','males'}};
comment.tL_Ofm = 'Data from Onega Bay, White Sea'; title.tL_Ofm = 'Onega Bay, White Sea';
%
data.tL_Vfm = [... % time since birth (yr), total length (cm)
 3  NaN    11.623
 4	13.641 12.068
 5	16.108 12.688
 6	17.349 13.133
 7	18.325 13.753
 8	18.862 13.935
 9	19.401 14.116
10	20.904 14.737
11	21.968 16.585
12	22.857 14.749
13	24.711 16.861
14	26.214 16.341
16	26.500 NaN];
data.tL_Vfm(:,1) = 365 * (0 + data.tL_Vfm(:,1)); 
units.tL_Vfm = {'d', 'cm'}; label.tL_Vfm = {'time since birth', 'total length'};  
temp.tL_Vfm = C2K(-0.1); units.temp.tL_Vfm = 'K'; label.temp.tL_Vfm = 'temperature';
bibkey.tL_Vfm = 'SemuFuks2015'; treat.tL_Vfm = {1 {'females','males'}};
comment.tL_Vfm = 'Data from Voronka Bay, White Sea'; title.tL_Vfm = 'Voronka Bay, White Sea';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Dfm = 5 * weights.tL_Dfm;
weights.tL_Ofm = 5 * weights.tL_Ofm;
weights.tL_Vfm = 5 * weights.tL_Vfm;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.title = title;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Length-weight: Ww in g = 0.00437*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3V7KB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570130'; % Ency of Life
metaData.links.id_Wiki = 'Liopsetta_glacialis'; % Wikipedia
metaData.links.id_ADW = 'Liopsetta_glacialis'; % ADW
metaData.links.id_Taxo = '46952'; % Taxonomicon
metaData.links.id_WoRMS = '275844'; % WoRMS
metaData.links.id_fishbase = 'Liopsetta-glacialis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liopsetta_glacialis}}';
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
bibkey = 'SemuFuks2015'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217030110}, ' ...
'author = { A. V. Semushina and G. V. Fuksa and N. A. Shilova}, ' ... 
'year = {2015}, ' ...
'title = {Flatfishes of the {W}hite {S}ea: {N}ew Data on the Biology of the {A}rctic Flounder \emph{Liopsetta glacialis}, {E}uropean Flounder \emph{Platichthys Flesus}, and Common Dab \emph{Limanda Limanda}}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {55(4)}, ' ...
'pages = {527-539}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Liopsetta-glacialis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
