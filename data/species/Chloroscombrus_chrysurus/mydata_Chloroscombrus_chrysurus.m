function [data, auxData, metaData, txtData, weights] = mydata_Chloroscombrus_chrysurus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Chloroscombrus_chrysurus'; 
metaData.species_en = 'Atlantic bumper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAE','MAm'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikametaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 02];

%% set data
% zero-variate data
data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(26.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'QueiSalv2018';   
  temp.am = C2K(26.2); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 12.4; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 65;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 20.2; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'fishbase: based on 0.01230*Lp^2.94, see F1';
data.Wwi = 2630; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'fishbase: based on 0.01230*Li^2.94, see F1; max published weight 121 g';

data.Ri  = 106200/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(26.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.972	7.173
0.972	7.970
0.979	5.693
0.987	6.091
0.987	6.376
0.987	6.546
0.987	6.717
0.987	7.287
0.988	8.197
0.994	4.042
0.995	7.287
1.003	4.668
1.003	7.628
1.004	8.482
1.004	10.019
1.004	10.759
1.011	8.027
1.012	8.880
1.012	8.994
1.012	9.564
1.019	7.799
1.027	7.287
1.965	8.254
1.967	13.321
1.982	12.239
1.982	12.524
1.982	12.524
1.989	9.051
1.990	11.214
1.990	11.328
1.990	11.613
1.990	11.954
1.990	12.011
1.990	12.182
1.990	13.491
1.990	13.719
1.991	14.345
1.991	14.915
1.998	13.036
1.999	14.459
1.999	15.427
1.999	17.135
2.005	10.304
2.005	10.873
2.006	12.922
2.006	14.573
2.013	10.247
2.021	10.645
2.031	17.818
2.037	9.848
2.953	16.395
2.962	19.583
2.969	16.110
2.969	16.793
2.969	17.761
2.969	18.956
2.976	14.459
2.977	15.882
2.977	18.273
2.977	18.558
2.983	11.841
2.983	12.125
2.984	14.118
2.984	15.199
2.985	17.078
2.985	17.192
2.985	17.647
2.991	10.873
2.993	17.306
2.994	21.290
2.999	12.581
3.000	13.321
3.000	13.662
3.001	20.550
3.002	22.372
3.008	15.142
3.954	15.939
3.970	14.972
3.978	16.452
3.979	18.786
3.979	19.753
3.985	14.231
3.986	17.362
3.986	17.818
3.986	18.387
3.987	19.298
3.987	19.981
3.987	20.095
3.987	22.144
3.988	25.104
3.993	13.605
3.993	13.833
3.995	20.949
3.995	21.575
3.995	22.429
3.996	23.624
4.001	12.694
4.002	18.159
4.002	18.956
4.003	20.664
4.004	24.137
4.011	20.152
4.019	20.550
4.957	19.583
4.988	18.729
4.988	20.436
4.989	21.404
4.989	23.624
4.995	16.395
4.996	19.013
4.996	19.355
4.996	20.721
4.997	22.713
5.003	15.712
5.003	17.533
5.004	21.006
5.011	15.313
5.012	19.981
5.012	20.778
5.028	22.087
5.029	25.617
5.991	24.706
5.997	18.444
5.998	21.461
5.998	21.973
6.005	20.209
6.006	21.176
6.014	22.884
6.014	23.567];
data.tL(:,1) = (0 + data.tL(:,1))*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(26.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'QueiSalv2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Y8Z7'; % Cat of Life
metaData.links.id_ITIS = '5Y8Z7'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Chloroscombrus_chrysurus'; % Wikipedia
metaData.links.id_ADW = 'Chloroscombrus_chrysurus'; % ADW
metaData.links.id_Taxo = '170914'; % Taxonomicon
metaData.links.id_WoRMS = '159483'; % WoRMS
metaData.links.id_fishbase = 'Chloroscombrus-chrysurus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chloroscombrus_chrysurus}}';  
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
bibkey = 'QueiSalv2018'; type = 'article'; bib = [ ... 
'doi = {10.3750/AIEP/02315}, ' ...
'author = {Joyce D.G.R. De Queiroz and Nathallia L.A. Salvador and Marcia F. Sousa and Victor E.L. Da Silva and Nidia N. Fabr\''{e} and Vandick S. Batista}, ' ...
'year = {2018}, ' ...
'title = {LIFE-HISTORY TRAITS OF \emph{Chloroscombrus_chrysurus} ({A}CTINOPTERYGII:  {P}ERCIFORMES: {C}ARANGIDAE) IN TROPICAL WATERS OF THE {A}TLANTIC {O}CEAN}, ' ... 
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {48(1)}, ' ...
'pages = {1–8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Chloroscombrus-chrysurus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
