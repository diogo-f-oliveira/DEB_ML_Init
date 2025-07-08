  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_barbouri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_barbouri'; 
metaData.species_en = 'Teardrop darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 05]; 

%% set data
% zero-variate data
data.tp = 0.6*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'Flyn1975';   
  temp.tp = C2K(21); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on mature at 1 yr';
data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'Flyn1975';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.1;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'Flyn1975'; 
data.Li = 5.1;   units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on TL 6 cm and F1';

data.Wwb = 2.7e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Flyn1975';
  comment.Wwb = 'based on egg diameter of 1.73 mm: pi/6*0.173^3';
 
data.Ri = 48/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Flyn1975';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    0 3.12
    1 4.23
    2 4.60];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Flyn1975';

% time-weight
data.tWw = [ ... % time since birth (yr), wet weight (g)
    0 0.52
    1 1.33
    2 1.55];
data.tWw(:,1) = 365 * (0.8 + data.tWw(:,1));  % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'standard length'};  
temp.tWw = C2K(21);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Flyn1975';

data.LWw = [ ... % std length (cm), wet weight (g)
1.480	0.044
1.807	0.072
1.807	0.083
1.878	0.090
1.922	0.094
1.966	0.109
2.090	0.121
2.099	0.135
2.187	0.143
2.276	0.169
2.409	0.203
2.409	0.217
2.488	0.222
2.488	0.225
2.612	0.266
2.612	0.273
2.656	0.270
2.780	0.318
2.781	0.344
2.887	0.363
2.887	0.388
3.002	0.404
3.020	0.470
3.108	0.474
3.108	0.503
3.188	0.485
3.197	0.493
3.206	0.511
3.312	0.526
3.329	0.534
3.400	0.563
3.400	0.585
3.480	0.597
3.507	0.619
3.542	0.663
3.595	0.634
3.613	0.667
3.710	0.697
3.711	0.759
3.817	0.789
3.825	0.752
3.914	0.808
3.932	0.881
4.011	0.849
4.022	1.252
4.057	1.047
4.109	0.867
4.119	1.194
4.216	1.084
4.252	1.301
4.305	1.184
4.330	0.946
4.465	1.365
4.571	1.361
4.623	1.281
4.633	1.556
4.731	1.729
4.732	1.857];
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'Flyn1975';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;

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
D2 = 'Mean temperature is guessed, but varied between 0 and 27 C';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-length from photo: SL = 0.85 * TL';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3BL29'; % Cat of Life
metaData.links.id_ITIS = '168373'; % ITIS
metaData.links.id_EoL = '223652'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_barbouri'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_barbouri'; % ADW
metaData.links.id_Taxo = '174068'; % Taxonomicon
metaData.links.id_WoRMS = '1013152'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-barbouri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_barbouri}}';  
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
bibkey = 'Flyn1975'; type = 'phdthesis'; bib = [ ... 
'author = {Rory Flynn}, ' ...
'year = {1975}, ' ...
'title = {The life history of the teardrop darter, \emph{Etheostoma barbouri} {K}uehne and {S}mall, in {K}entucky}, ' ... 
'school = {Western Kentucky Univ}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-barbouri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
