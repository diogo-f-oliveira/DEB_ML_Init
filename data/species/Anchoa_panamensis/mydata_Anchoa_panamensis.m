function [data, auxData, metaData, txtData, weights] = mydata_Anchoa_panamensis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Anchoa_panamensis'; 
metaData.species_en = 'Panama  anchovy'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 16];

%% set data
% zero-variate data
data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 2.5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.6;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'based on Anchoa_nasus: 6*18.7/17';
data.Li = 18.7;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm of Anchoa_nasus: pi/6*0.06^3';
data.Wwp = 1.9; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00490*Lp^3.15, see F1';
data.Wwi = 49.7; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.15, see F1';
    
data.Ri = 32e3/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(27.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on total fecundity of Anchoa_nasus: (18.7/8.292)^3*2839.929';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
45.803	3.402
75.501	6.292
104.483	7.380
135.671	8.252
164.857	8.331
196.002	9.420
226.094	10.364
259.226	12.317
285.197	12.251];
units.tL = {'d', 'cm'};  label.tL = {'time since birth','total length'}; 
temp.tL = C2K(27.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PalaPhil1984';

% length-weight
data.LW = [ ... % std length (cm), weight (g)
2.898	1.366
6.045	1.133
7.651	4.169
9.678	5.463
10.817	9.515
12.262	10.740
12.585	14.216
13.866	16.022
14.958	20.654
15.025	24.639];
data.LW(:,1) = data.LW(:,1)*1.1; % convert SL to TL
units.LW = {'cm', 'g'};  label.LW = {'total length', 'weight'}; 
bibkey.LW = 'Jose1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.1*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'DKTB'; % Cat of Life
metaData.links.id_ITIS = '161852'; % ITIS
metaData.links.id_EoL = '46562594'; % Ency of Life
metaData.links.id_Wiki = 'Anchoa'; % Wikipedia
metaData.links.id_ADW = 'Anchoa_panamensis'; % ADW
metaData.links.id_Taxo = '160858'; % Taxonomicon
metaData.links.id_WoRMS = '275529'; % WoRMS
metaData.links.id_fishbase = 'Anchoa-panamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Anchoa_panamensis}}';  
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
bibkey = 'PalaPhil1984'; type = 'Article'; bib = [ ...  
'author = {Palacios, J.A. and P.C. Phillips}, ' ...
'year = {1984}, ' ...
'title = {An\''{a}lisis de la estructura poblacional de \emph{Anchoa panamensis} ({S}teindachner, 1875) en el {G}olfo de {N}icoya, {C}osta {R}ica}, ' ... 
'journal = {Rev. Biol. Trop.}, ' ...
'volume = {32(1)}, ' ...
'pages = {77-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Anchoa-panamensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
