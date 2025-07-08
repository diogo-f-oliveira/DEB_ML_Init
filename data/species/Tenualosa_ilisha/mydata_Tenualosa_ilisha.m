  function [data, auxData, metaData, txtData, weights] = mydata_Tenualosa_ilisha
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Tenualosa_ilisha'; 
metaData.species_en = 'Ilish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2018 12 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 21]; 

%% set data
% zero-variate data
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 41.5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 1.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MaraEska2016';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 900.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','AminArsh2005'};
  comment.Wwi = 'based on 10^(-2.516 + 3.381*log10(Lp)), see F1';
data.Wwi = 3.1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'wiki','AminArsh2005'};
  comment.Wwi = 'based on 10^(-2.516 + 3.381*log10(Li)), see F1';
  
data.Ri = 1.5e6/365;units.Ri = '#/d';  label.Ri = 'reprod rate at TL of 45 cm';    bibkey.Ri = 'AlmuJasi2016';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % year class (d), total length (cm)
595.122	25.194
647.195	24.612
676.951	27.524
699.268	26.942
729.024	27.524
822.012	27.816
822.012	30.000
892.683	28.398
896.402	30.437
941.037	30.437
970.793	32.039
1011.707	33.058
1037.744	33.058
1067.500	37.282
1127.012	34.369
1156.768	34.078
1182.805	35.971
1208.841	36.408
1253.476	37.136
1394.817	39.029
1398.537	41.359
1398.537	41.942
1446.890	42.816
1454.329	41.359
1461.768	42.816
1513.841	41.068
1528.719	39.903
1543.598	41.942
1554.756	39.903
1554.756	43.689
1603.110	37.864
1636.585	41.068
1636.585	44.563
1677.500	41.359
1692.378	43.835
1707.256	44.854
1737.012	42.087
1737.012	43.398
1737.012	45.291
1737.012	46.602
1796.524	47.767
1900.671	46.893
1975.061	48.641
2004.817	49.369
2079.207	44.417
2094.086	51.262
2108.963	50.680
2168.476	45.437
2168.476	44.417
2227.988	52.864
2309.817	53.010
2313.537	46.602
2454.878	53.738
2492.073	53.592
2525.549	47.913
2551.585	55.340];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'RahmCowx2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: log10(W in g) = -2.516 + 3.381*log10(TL in cm)';
metaData.bibkey.F1 = 'AminArsh2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '55B85'; % Cat of Life
metaData.links.id_ITIS = '551297'; % ITIS
metaData.links.id_EoL = '46562485'; % Ency of Life
metaData.links.id_Wiki = 'Tenualosa_ilisha'; % Wikipedia
metaData.links.id_ADW = 'Tenualosa_ilisha'; % ADW
metaData.links.id_Taxo = '188874'; % Taxonomicon
metaData.links.id_WoRMS = '278568'; % WoRMS
metaData.links.id_fishbase = 'Tenualosa-ilisha'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Tenualosa_ilisha}}';  
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
bibkey = 'RahmCowx2006'; type = 'Article'; bib = [ ... 
'author = {M. J. Rahman and I. G. Cowx}, ' ... 
'year = {2006}, ' ...
'title = {Lunar periodicity in growth increment formation in otoliths of hilsa shad (\emph{Tenualosa ilisha}, {C}lupeidae) in {B}angladesh waters}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {81}, ' ...
'pages = {342-344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AminArsh2005'; type = 'Article'; bib = [ ... 
'author = {S. M. Nurul Amin and A. Arshad and G. C. Haldar and S. Shohaimi and R. Ara}, ' ... 
'year = {2005}, ' ...
'title = {Estimation of Size Frequency Distribution, Sex Ratio and Length-Weight Relationship of Hilsa (\emph{Tenualosa ilisha}) in the {B}angladesh Water}, ' ...
'journal = {Research Journal of Agriculture and Biological Sciences}, ' ...
'volume = {1}, ' ...
'pages = {61-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlmuJasi2016'; type = 'Article'; bib = [ ... 
'author = {Mustafa Ahmed Almukhtar and Watfa Jasim and Falah Mutlak}, ' ...
'doi = {10.3923/jfas.2016.43.55}, ' ...
'year = {2016}, ' ...
'title = {Reproductive Biology of Hilsa Shad \emph{Tenualosa ilisha} ({T}eleostei: {C}lupeidae) During Spawning Migration in the {S}hatt {A}l {A}rab {R}iver and Southern {A}l {H}ammar {M}arsh, {B}asra, {I}raq}, ' ...
'journal = {Journal of Fisheries and Aquatic Science}, ' ...
'volume = {11}, ' ...
'pages = {43-55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaraEska2016'; type = 'Article'; bib = [ ... 
'author = {J. Ghafleh Marammazi and G. R. Eskandari and M. A. Al-Mukhtar and B. H, Kiabi}, ' ...
'doi = {10.3923/jfas.2016.43.55}, ' ...
'year = {2016}, ' ...
'title = {Study of spawning season and spawing ground of soboor (\emph{Tenualosa ilisha}, {H}am. {B}unch., 1822) during its migration in {K}huzestan rivers}, ' ...
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {4}, ' ...
'pages = {89-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Tenualosa-ilisha.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
