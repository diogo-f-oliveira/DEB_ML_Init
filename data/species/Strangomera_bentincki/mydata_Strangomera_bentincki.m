function [data, auxData, metaData, txtData, weights] = mydata_Strangomera_bentincki

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Strangomera_bentincki'; 
metaData.species_en = 'Araucanian herring'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 12];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 10.5;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 28.4;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 8.63; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00603*Lp^3.09, see F1';
data.Wwi = 186.7; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.09, see F1';
  
data.Ri = 10414/365;   units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'CubiAlar2011';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.98';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
59.677	6.144
89.125	7.331
122.840	8.979
148.034	9.771
189.776	9.906
223.244	10.370
360.945	10.580
511.874	14.212
574.447	14.217
607.983	15.010
628.539	13.564
658.042	15.014
691.441	15.149
716.498	15.283
762.425	15.484
779.207	15.946
829.348	16.345
862.583	15.691
908.620	16.418
925.224	16.025
962.850	16.423
983.680	16.294
1025.395	16.297
1054.595	16.300
1083.796	16.303
1117.099	15.977];
data.tL(:,1) = data.tL(:,1)-data.tL(1,1); % set origin at first data point
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(18); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CubiBuca2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
       
%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperature (in C) is assumed to vary as T(t)=12+9*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6F8X5'; % Cat of Life
metaData.links.id_ITIS = '551338'; % ITIS
metaData.links.id_EoL = '46562563'; % Ency of Life
metaData.links.id_Wiki = 'Strangomera_bentincki'; % Wikipedia
metaData.links.id_ADW = 'Strangomera_bentincki'; % ADW
metaData.links.id_Taxo = '173701'; % Taxonomicon
metaData.links.id_WoRMS = '272284'; % WoRMS
metaData.links.id_fishbase = 'Strangomera-bentincki'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Strangomera_bentincki}}';  
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
bibkey = 'CubiBuca2002'; type = 'Article'; bib = [ ...  
'author = {Luis A. Cubillos and Doris A. Bucarey and Mariella Canales}, ' ...
'year = {2002}, ' ...
'title = {Monthly abundance estimation for common sardine \emph{Strangomera bentincki} and anchovy \emph{Engraulis ringens} in the central-southern area off {C}hile (34-40 S)}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {57}, '...
'pages = {117-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CubiAlar2011'; type = 'Article'; bib = [ ...  
    'doi = {10.7773/cm.v37i4B.1749 }, '...
'author = {L.A. Cubillos and C. Alarc\''{o}n and C. Castillo-Jord\''{a}n and G. Claramunt and C. Oyarz\''{u}n and S Gacit\''{u}a}, ' ...
'year = {2011}, ' ...
'title = {Spatial and temporal changes in batch fecundity of common sardine and anchovy off central and southern {C}hile (2002–2007)}, ' ... 
'journal = {Ciencias Marinas}, ' ...
'volume = {37(4B)}, '...
'pages = {547–564}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Strangomera-bentincki.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
