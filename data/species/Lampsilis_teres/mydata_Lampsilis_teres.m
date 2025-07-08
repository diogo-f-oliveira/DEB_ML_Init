function [data, auxData, metaData, txtData, weights] = mydata_Lampsilis_teres

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Unionoida'; 
metaData.family     = 'Unionidae';
metaData.species    = 'Lampsilis_teres'; 
metaData.species_en = 'Yellow sandshell'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li';  'Wwi'; 'Ri'};
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2021 02 04];      


%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'unio';   
  temp.ab = C2K(16);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 14*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HaagRype2011';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'unio';  
data.Lj  = .03;   units.Lj  = 'cm';  label.Lj  = 'shell length at settlement';   bibkey.Lj  = 'unio';  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp 20 yr and tL data';
data.Li  = 14.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HaagRype2011';

data.Wwi  = 114.3; units.Wwi  = 'g';  label.Wwi  = 'ultimate dry weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Unio_tumidus : 14*(14.7/7.3)^3';
 
data.Ri = 4631633/365;    units.Ri = '1/d';    label.Ri = 'reproduction rate for SL 12.9 cm'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
  
% time-length
data.tL1 = [ ... % time since settlement (yr), shell length (cm)
1.000	3.642
1.050	1.962
1.051	2.336
1.053	2.802
1.054	3.129
2.028	7.563
2.030	7.936
2.031	8.263
2.032	8.589
2.033	8.869
2.034	9.149
2.036	9.849
2.048	5.231
2.050	5.604
2.051	6.024
2.055	7.237
2.072	4.065
2.073	4.298
2.082	6.677
2.083	7.097
2.987	7.426
3.046	8.173
3.046	8.406
3.048	8.919
3.079	9.526
3.079	9.712
3.080	9.992
3.081	10.225
3.082	10.458
3.083	10.692
3.084	11.065
3.085	11.298
3.116	12.138
3.483	12.279
3.484	12.652
3.789	11.114
3.808	8.595
3.847	11.487
3.870	10.134
4.092	9.016
4.095	9.949
4.103	12.141
4.103	12.234
4.104	12.467
4.105	12.654
4.106	12.981
4.127	10.928
4.128	11.255
4.128	11.395
4.129	11.721
4.775	10.837
5.003	11.677
5.036	12.890
5.061	12.097
5.062	12.331
5.063	12.564
5.087	11.304
5.221	9.346
6.042	10.234
6.106	12.427
6.107	12.707
6.871	13.502
7.548	13.784
7.856	13.132
7.858	13.645
7.883	12.852
8.498	11.222
8.818	13.882
8.843	13.135
9.438	13.790
9.828	12.485
10.788	13.095
10.790	13.561
11.780	14.357
12.481	13.426];
data.tL1(:,1) = 365 * (0 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time', 'shell length', 'St. Francis R., AR'};  
temp.tL1 = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'HaagRype2011';
comment.tL1 = 'Data from St. Francis R., AR; mean temperature is guessed';
%
data.tL2 = [ ... % time since settlement (yr), shell length (cm)
0.968	2.615
1.138	2.989
2.018	4.718
2.020	5.277
3.069	6.820
3.070	7.146
3.947	7.849
4.033	8.409
4.036	9.295
4.796	8.785
4.878	8.225
5.053	9.718
5.054	9.951
5.079	9.112
6.042	10.421
6.067	9.581
7.055	9.864
7.877	10.893
8.100	10.427
8.889	10.290
13.882	10.819];
data.tL2(:,1) = 365 * (0 + data.tL2(:,1));
units.tL2 = {'d', 'cm'}; label.tL2 = {'time', 'shell length', 'Sipsey R., AL'};  
temp.tL2 = C2K(15);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'HaagRype2011';
comment.tL2 = 'Data from Sipsey R., AL; mean temperature is guessed';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL1 = 10 * weights.tL1;
weights.tL2 = 10 * weights.tL2;
weights.Li = 3 * weights.Li;
weights.Lj = 0 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from St. Francis R., Sipsey R.'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3S5ZL'; % Cat of Life
metaData.links.id_ITIS = '80006'; % ITIS
metaData.links.id_EoL = '449587'; % Ency of Life
metaData.links.id_Wiki = 'Lampsilis_teres'; % Wikipedia
metaData.links.id_ADW = 'Lampsilis_teres'; % ADW
metaData.links.id_Taxo = '432383'; % Taxonomicon
metaData.links.id_WoRMS = '857329'; % WoRMS
metaData.links.id_molluscabase = '857329'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampsilis_teres}}';
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
bibkey = 'HaagRype2011'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1469-185X.2010.00146.x}, ' ...
'author = {Wendell R. Haag and Andrew L. Rypel1}, ' ... 
'year = {2011}, ' ...
'title = {Growth and longevity in freshwater mussels: evolutionary and conservation implications}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {86}, ' ...
'pages = {225-247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Haag2013'; type = 'Article'; bib = [ ...
'doi = {10.1111/brv.12028}, ' ...
'author = {Wendell R. Haag }, ' ... 
'year = {2013}, ' ...
'title = {The role of fecundity and reproductive effort in defining life-history strategies of {N}orth {A}merican freshwater mussels}, ' ...
'journal = {Biol. Rev.}, ' ...
'volume = {88}, ' ...
'pages = {745-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'unio'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.unio.lu/freshwater-mussel/biology/reproduction-cycle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

