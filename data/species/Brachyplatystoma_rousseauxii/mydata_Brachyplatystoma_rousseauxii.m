  function [data, auxData, metaData, txtData, weights] = mydata_Brachyplatystoma_rousseauxii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pimelodidae';
metaData.species    = 'Brachyplatystoma_rousseauxii'; 
metaData.species_en = 'Zungaro dorado'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 88.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';bibkey.Lp = 'CordLeon2013';
data.Lpm = 81.7; units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';bibkey.Lpm = 'CordLeon2013';
data.Li = 192;  units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
data.Lim = 173;  units.Lim = 'cm';   label.Lim = 'ultimate total length for males';  bibkey.Lim = {'fishbase','CordLeon2013'};
  comment.Lim = 'based on Li*91.8/101.6';

data.Wwb = 2.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AndrMakr2014';
  comment.Wwb = 'based on egg diameter of 1.74 mm of Hemisorubim_platyrhynchos: pi/6*0.174^3';
data.Wwp = 8.3e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','CordLeon2013'};
  comment.Wwp = 'based on 0.00468*Lp^3.13, see F1';
data.Wwi = 94.1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.12, see F1';

data.GSI = 0.20; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.960	57.267
0.961	62.382
0.961	63.073
0.974	51.875
0.975	56.714
0.975	58.373
0.976	60.585
0.976	61.138
0.976	61.967
0.977	67.359
0.990	54.364
0.990	54.917
0.990	55.470
0.990	58.926
0.991	63.903
1.005	56.162
1.005	60.033
1.006	64.318
1.006	65.010
1.006	65.977
1.006	66.669
1.007	69.434
1.932	66.833
1.948	72.086
1.949	77.202
1.962	68.354
1.962	68.631
1.962	70.428
1.963	76.096
1.977	69.461
1.978	73.608
1.978	74.852
1.978	76.511
1.979	78.170
1.979	78.585
1.979	79.276
1.979	80.106
1.979	80.659
1.994	81.350
1.994	82.042
1.994	83.009
1.994	83.839
2.965	85.801
2.965	88.151
2.966	91.746
2.967	96.723
2.978	77.368
2.978	77.783
2.979	83.866
2.980	84.419
2.980	86.216
2.980	87.875
2.981	90.226
2.981	90.917
2.981	91.332
2.981	92.576
2.993	73.913
2.994	83.314
2.995	86.908
2.995	89.535
3.010	84.973
3.011	94.789
3.025	88.844
3.982	100.760
3.996	94.263
3.997	97.028
3.997	97.996
3.997	98.963
4.011	93.710
4.011	96.199
4.026	94.955
4.998	103.553
4.998	104.383
4.998	105.074
5.012	101.756
5.012	102.586
5.028	105.628
5.028	106.043
5.028	107.287];
data.tL(:,1) = (data.tL(:,1) + 0.6) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SuarRafa2023';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'MYHM'; % Cat of Life
metaData.links.id_ITIS = '681736'; % ITIS
metaData.links.id_EoL = '209864'; % Ency of Life
metaData.links.id_Wiki = 'Brachyplatystoma_rousseauxii'; % Wikipedia
metaData.links.id_ADW = 'Brachyplatystoma_rousseauxii'; % ADW
metaData.links.id_Taxo = '164548'; % Taxonomicon
metaData.links.id_WoRMS = '1021508'; % WoRMS
metaData.links.id_fishbase = 'Brachyplatystoma-rousseauxii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brachyplatystoma_rousseauxii}}';  
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
bibkey = 'SuarRafa2023'; type = 'Article'; bib = [ ...
'doi = {10.18684/rbsaa.v21.n1.2023.2030}, ' ...
'author = {Gonz\''{a}lez Su\''{a}rez and \''{A}ngel Rafael}, ' ...
'year = {2023}, ' ...
'title = {Crecimiento del bagre dorado \emph{Brachyplatystoma rousseauxii} en la regi\''{o}n del {O}rinoco {M}edio usando modelos m\''{u}ltiples}, ' ... 
'journal = {Revista Biotecnolog\''{i}a en el Sector Agropecuario y Agroindustrial}, ' ...
'volume = {21(1)}, '...
'pages = {97-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CordLeon2013'; type = 'Article'; bib = [ ...
'author = {Edwin Agudelo C\''{o}rdoba and \''{A}ngela Viviana Joven Le\''{o}n and C\''{e}sar Augusto Bonilla-Castillo and Miguel Petrere Junior and Marl\''{o}n Pel\''{a}ez and Fabrice Duponchelle}, ' ...
'year = {2013}, ' ...
'title = { Breeding, growth and exploitation of \emph{Brachyplatystoma rousseauxii} {C}astelnau, 1855 in the {C}aqueta {R}iver, {C}olombia}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {11(3)}, '...
'pages = {637-647}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrMakr2014'; type = 'Article'; bib = [ ...
'author = {Fernanda F. Andrade and Maristela C. Makrakis and Ariane F. de Lima and Lucileine de Assump\c{c}\~{a}o and Sergio Makrakis and Suelen F. R. Pini}, ' ...
'year = {2014}, ' ...
'title = {Desenvolvimento embrion\''{a}rio, larval e juvenil de \emph{Hemisorubim platyrhynchos} ({S}iluriformes, {P}imelodidae) da bacia do rio {P}aran\''{a}}, ' ... 
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {104(1)}, '...
'pages = {70-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Brachyplatystoma-rousseauxii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

