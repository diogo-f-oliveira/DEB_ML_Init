  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_leucomaenis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_leucomaenis'; 
metaData.species_en = 'Whitespotted char'; 

metaData.ecoCode.climate = {'Cfb', 'MC'};
metaData.ecoCode.ecozone = {'THp', 'MPNW'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.am = 9*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 42;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Salvelinus_namaycush';
data.Li = 120;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwi = 15e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 3515/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_f = [... % time since birth (yr), length (cm)
0.812	9.457
0.812	11.276
0.812	12.033
0.812	12.639
0.821	14.078
1.316	13.162
1.325	12.480
1.325	12.631
1.325	14.222
1.325	16.874
1.333	12.025
1.521	14.295
1.521	15.053
1.521	15.583
1.821	15.351
1.821	15.730
1.821	16.109
1.829	18.230
1.829	18.457
1.829	20.275
1.838	16.866
2.308	23.223
2.316	16.556
2.316	17.238
2.325	16.025
2.325	18.980
2.325	19.586
2.333	18.222
2.350	17.767
2.829	18.821
2.829	25.790
2.829	26.700
2.829	29.200
2.829	29.654
2.838	27.305
2.838	28.063
3.316	19.344
3.325	17.450
3.829	30.321
3.846	32.214
3.846	36.078
4.838	36.518];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f = C2K(8.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mori2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (yr), length (cm)
0.299	9.391
0.299	9.769
0.479	9.388
0.778	13.086
0.786	11.651
0.786	15.731
0.786	17.318
0.795	13.993
1.282	11.945
1.291	12.701
1.291	13.532
1.299	14.892
1.299	17.688
1.299	19.426
1.308	14.288
1.487	15.040
1.786	17.983
1.786	18.361
1.795	28.789
1.803	15.640
1.803	16.018
1.803	16.396
2.282	14.802
2.291	16.162
2.291	16.540
2.291	17.220
2.299	19.184
2.308	18.429
2.803	18.270
2.803	25.978
2.803	26.885
2.803	27.338
2.803	27.943
2.803	33.005
3.308	19.471
3.803	28.456
3.803	37.978
3.812	31.857
4.812	35.242
4.812	34.184];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m = C2K(8.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mori2001';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperatures are guessed; known as a cold-water species';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);
                                 
%% Links
metaData.links.id_CoL = '6XG2R'; % Cat of Life
metaData.links.id_ITIS = '623532'; % ITIS
metaData.links.id_EoL = '204578'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_leucomaenis'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_leucomaenis'; % ADW
metaData.links.id_Taxo = '569902'; % Taxonomicon
metaData.links.id_WoRMS = '293725'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-leucomaenis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_leucomaenis}}';  
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
bibkey = 'Mori2001'; type = 'Article'; bib = [ ...  
'doi = {10.1006/jfbi.2001.1793}, ' ...
'author = {K. Morita}, ' ...
'year = {2001}, ' ...
'title = {The growth history of anadromous white-spotted charr in northern {J}apan: a comparison between river and sea life}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {59}, '...
'pages = {1556-1565}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-leucomaenis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
