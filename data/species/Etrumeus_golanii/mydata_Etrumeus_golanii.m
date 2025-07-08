function [data, auxData, metaData, txtData, weights] = mydata_Etrumeus_golanii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dussumieriidae';
metaData.species    = 'Etrumeus_golanii'; 
metaData.species_en = 'Golani''s round herring'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAS'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 18];

%% set data
% zero-variate data;

data.ab = 30;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(15.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'YilmHocs2003';   
  temp.am = C2K(15.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 14.5;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 20.8; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'SomaGian2021';
  comment.Wwb = 'based on egg diameter of 1.3: pi/6*0.18^3';
data.Wwi = 65.5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi=0.00537*Li^3.13, see F1';
  
% uni-variate data

% time-length
data.tL_fm = [ % time since birth (d), standard length (cm)
    1 14.50 13.96
    2 17.91 17.90
    3 20.89 20.87];
data.tL_fm(:,1) = (data.tL_fm(:,1)+1.1) * 365;
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'standard length'};  
temp.tL_fm = C2K(15.6);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};     
bibkey.tL_fm = 'YilmHocs2003';

% weight-fecundity
data.WN = [ ... % log10 weight (g), log10 fecundity (#)
1.254	3.155
1.322	3.074
1.400	3.424
1.416	3.467
1.449	3.448
1.458	3.566
1.506	3.405
1.509	3.460
1.527	3.364
1.542	3.513
1.542	3.479
1.547	3.373
1.569	3.541
1.580	3.631
1.580	3.519
1.592	3.596
1.621	3.637
1.651	3.658
1.663	3.627
1.669	3.590
1.706	3.568
1.719	3.633
1.724	3.661
1.754	3.785
1.755	3.654
1.759	3.816
1.762	3.909
1.775	3.757
1.775	3.713
1.793	3.688
1.797	3.747
1.816	3.974
1.816	3.930
1.816	3.896
1.830	4.023
1.841	3.766
1.846	3.849
1.846	3.812
1.853	3.921
1.856	3.989
1.860	3.735
1.876	3.750
1.883	3.874
1.888	3.961
1.889	3.905
1.891	3.831
1.896	4.069
1.903	3.911
1.903	3.799
1.906	3.883
1.909	3.849
1.924	4.041
1.960	3.939
1.964	3.867
1.983	4.100
1.984	4.001
2.008	4.013
2.018	4.038
2.020	4.087
2.036	4.084
2.041	4.239
2.041	4.028
2.053	3.910
2.114	4.084
2.154	4.164
2.180	4.350
2.190	4.257
2.192	4.108
2.303	4.191];
data.WN = 10.^data.WN; % remove log transform
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(15.6);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'RoelMelo1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Li = 2 * weights.Li;
weights.Wwb = 2 * weights.Wwb;
weights.Wwi = 2 * weights.Wwi;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Although YilmHocs2003 talk about E. teres, which is synonym for E. sadina, the assumption is that E. golanii is meant';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00537*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6H58P'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '43488338'; % Ency of Life
metaData.links.id_Wiki = 'Etrumeus'; % Wikipedia
metaData.links.id_ADW = 'Etrumeus_golanii'; % ADW
metaData.links.id_Taxo = '5379664'; % Taxonomicon
metaData.links.id_WoRMS = '890090'; % WoRMS
metaData.links.id_fishbase = 'Etrumeus-golanii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Etrumeus}}';
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
bibkey = 'YilmHocs2003'; type = 'Article'; bib = [ ...
'doi = {10.2989/02577619109504622}, ' ...
'author = {Raziye Y{\i}lmaz and Belgin Ho\c{s}sucu}, ' ... 
'year = {2003}, ' ...
'title = {Some Biological Parameters of Round Herring, \emph{Etrumeus teres} ({D}e {K}ay, 1842) in the {G}ulf of {A}ntalya ({M}editerranean {S}ea)}, ' ...
'journal = {E.U. Journal of Fisheries \& Aquatic Sciences}, ' ...
'volume = {20(1-2)}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SomaGian2021'; type = 'Article'; bib = [ ...
'doi = {10.12681/mms.27099}, ' ...
'author = {Stylianos Somarakis and Maria Giannoulaki and Konstantinos Markakis and Kostas Tsiaras and Eudoxia Schismenou and Panagiota Peristeraki}, ' ... 
'year = {2021}, ' ...
'title = {Ovarian dynamics, batch fecundity and spawning phenology of the {L}essepsian migrant \emph{Etrumeus golanii} {D}i{B}attista, {R}andall \& {B}owen, 2012 ({C}lupeidae: {D}ussumieriinae)}, ' ...
'journal = {Mediterranean Marine Science}, ' ...
'volume = {22(3)}, ' ...
'pages = {466-479}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Etrumeus-golanii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
