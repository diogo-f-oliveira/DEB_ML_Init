function [data, auxData, metaData, txtData, weights] = mydata_Callionymus_lyra
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Callionymiformes'; 
metaData.family     = 'Callionymidae';
metaData.species    = 'Callionymus_lyra'; 
metaData.species_en = 'Common dragonet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MANW','MAm'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(13.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 07];

%% set data
% zero-variate data
data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(13.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(13.3);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'KingFive1994';
  comment.Lp = '8 cm SL, converted to TL using F3';
data.Li = 25;  units.Li = 'cm';   label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';
data.Lim = 30.5;  units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 5.1e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'John1972';
  comment.Wwb = 'based on egg diameter of 0.46 mm: pi/6*0.046^3';
data.Wwp = 2.08;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^2.76, see F1';
data.Wwi = 42.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01096*Li^2.76, see F1';

data.GSI = 0.065; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'KingFive1994';
  temp.GSI = C2K(13.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI is 0.02, but 2 spawnings per yr';


% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
  0	 0.068  0.068
  1	 4.257  3.175
  2	 9.699  8.447
  3	12.840 14.261
  4	14.763 18.045
  5	15.908 NaN
  6	16.444 NaN];
data.tL_fm(:,1) = (1.2 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  treat.tL_fm = {1, {'female','male'}};
  temp.tL_fm = C2K(13.3);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Chan1951';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 5;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^2.76'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Males spawn once and then die in the Plymouth erea, but possibly not in Galway Bay'; 
metaData.bibkey.F2 = {'Chan1951','KingFive1994'}; 
F3 = 'length-length from photo: SL = 0.8*TL'; 
metaData.bibkey.F3 = {'fishbase'}; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'PR89'; % Cat of Life
metaData.links.id_ITIS = '171698'; % ITIS
metaData.links.id_EoL = '46571254'; % Ency of Life
metaData.links.id_Wiki = 'Callionymus_lyra'; % Wikipedia
metaData.links.id_ADW = 'Callionymus_lyra'; % ADW
metaData.links.id_Taxo = '46528'; % Taxonomicon
metaData.links.id_WoRMS = '126792'; % WoRMS
metaData.links.id_fishbase = 'Callionymus-lyra'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Callionymus_lyra}}';  
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
bibkey = 'Chan1951'; type = 'Article'; bib = [ ...
'doi = {10.2307/1442917}, ' ...
'author = {Hsiao-Wei Chang}, ' ...
'year = {1951}, ' ...
'title = {AGE AND GROWTH OF \emph{Callionymus lyra} {L}.}, ' ... 
'journal = {J. Mar. Biol. Assoc. U. K.}, ' ...
'volume = {30(2)}, '...
'pages = {281-296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KingFive1994'; type = 'Article'; bib = [ ...
'doi = {10.1017/S0025315400047639}, ' ...
'author = {King, Pauline A. and Fives, Julie M. and McGrath, David}, ' ...
'year = {1994}, ' ...
'title = {Reproduction, growth and feeding of the dragonet, \emph{Callionymus lyra} ({T}eleostei: {C}allionymidae), in {G}alway {B}ay, {I}reland}, ' ... 
'journal = {J. Mar. Biol. Assoc. U. K.}, ' ...
'volume = {74(3)}, '...
'pages = {513-526}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Callionymus-lyra.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

