function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_schlegelii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_schlegelii'; 
metaData.species_en = 'Blackhead seabream'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 17]; 

%% set data
% zero-variate data

data.tp = 365; units.tp = 'd';   label.tp = 'time since birth at puberty'; bibkey.tp = 'LawSado2018';
  temp.tp = C2K(23.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'LawSado2018';   
  temp.am = C2K(23.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'LawSado2018';
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwi = 3200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI  = 'guess';   
  temp.GSI = C2K(23.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Sparus aurata';

 % univariate data
 % time-length
 data.tL = [ ... % years class (yr), standard length (cm)
 0.059	16.222
 0.059	15.532
 0.059	14.584
 0.044	17.429
 0.044	13.894
 0.044	11.136
 0.029	18.722
 0.029	11.395
 0.015	9.929
0.000	12.429
0.968	17.783
0.982	13.472
0.982	16.145
0.982	18.300
0.982	18.645
0.997	14.421
0.997	15.455
0.997	16.662
0.997	19.679
1.012	20.283
1.012	20.886
1.012	21.662
1.012	22.179
1.012	22.783
1.012	23.559
1.012	24.248
1.012	24.766
1.012	25.197
1.012	26.662
1.012	28.128
1.950	17.705
1.965	30.464
1.965	29.084
1.965	23.653
1.979	31.412
1.979	29.688
1.979	23.912
1.994	28.481
1.994	25.205
1.994	22.533
1.994	22.188
2.009	33.654
2.009	25.636
2.009	20.291
2.009	19.688
2.009	19.085
2.009	18.654
2.023	26.326
2.038	27.706
2.038	27.274
2.038	26.757
2.038	21.412
2.962	30.645
2.977	31.076
3.006	20.731
3.006	25.472
3.006	25.990
3.006	26.852
3.006	28.059
3.006	29.007
3.006	29.266
3.006	29.697
3.006	31.938
3.006	33.490
3.006	34.610
3.006	36.593
3.974	35.308
3.974	34.274
3.974	31.860
3.988	34.791
3.988	32.550
3.988	29.102
4.003	37.378
4.003	36.429
4.003	36.085
4.003	31.257
4.003	30.740
4.003	30.136
4.032	33.412
4.971	36.438
4.985	28.593
4.985	31.610
4.985	32.731
4.985	34.541
4.985	37.472
4.985	38.507
5.000	33.766
5.015	30.404
5.015	35.662
5.982	39.205
5.982	38.257
5.997	37.653
5.997	37.136
5.997	35.326
5.997	34.464
6.026	35.843
6.041	31.188
6.965	32.145
6.979	35.679
6.994	34.731
6.994	36.714
6.994	37.317
6.994	37.834
6.994	41.714
7.977	36.550
7.991	35.774
7.991	37.929
7.991	38.447
8.988	36.214
9.003	36.904
9.003	38.455];    
data.tL(:,1) = 365 * (data.tL(:,1) + 0.75);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL   = C2K(23.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LawSado2018';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Protandrous hermaphrodite; Sex change (from male to female) at  2 yr';
metaData.bibkey.F1 = 'LawSado2018'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8YVQ'; % Cat of Life
metaData.links.id_ITIS = '647897'; % ITIS
metaData.links.id_EoL = '1156465'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus_schlegelii'; % Wikipedia
metaData.links.id_ADW = 'Acanthopagrus_schlegelii'; % ADW
metaData.links.id_Taxo = '654657'; % Taxonomicon
metaData.links.id_WoRMS = '293534'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-schlegelii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_schlegelii}}';
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
bibkey = 'LawSado2018'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13774}, ' ...
'author = {Calton S. W. Law and Yvonne Sadovy de Mitcheson}, ' ... 
'year = {2018}, ' ...
'title = {Age and growth of black seabream \emph{Acanthopagrus schlegelii} ({S}paridae) in {H}ong {K}ong and adjacent waters of the northern {S}outh {C}hina {S}ea}, ' ...
'journal = {J Fish Biol.}, ' ...
'volume = {93}, ' ...
'number = {1}, '...
'pages = {382-390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthopagrus-schlegelii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
