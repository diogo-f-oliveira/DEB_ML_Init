function [data, auxData, metaData, txtData, weights] = mydata_Macrognathus_pancalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Synbranchiformes'; 
metaData.family     = 'Mastacembelidae';
metaData.species    = 'Macrognathus_pancalus'; 
metaData.species_en = 'Barred spiny eel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 23];

%% set data
% zero-variate data

data.am = 10 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.5;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki'; 
data.Li  = 18.9;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 1.3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'BoraSona2020';
  comment.Wwb = 'based on egg diameter of 1.35 mm: pi/6*0.135^3';
data.Wwi = 29.1;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 0.00407*Li^3.02, see F1';

data.Ri  = 8310/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.000	0.014
17.173	0.641
34.323	1.606
42.854	2.730
47.970	3.452
58.228	4.496
66.764	5.540
78.717	6.985
90.697	8.029
106.115	9.154
123.254	10.280
142.148	10.925
166.185	11.892
195.421	12.379
222.962	12.465
250.509	12.471
278.039	12.718
300.410	12.883
322.780	13.048
345.135	13.453
367.478	14.019
379.463	14.983
388.000	16.027
406.900	16.592
424.089	16.996
451.630	17.083
482.609	17.250
508.412	17.576
539.386	17.823
570.343	18.311
594.385	19.197
618.450	19.763
639.071	20.329
661.409	20.975
683.763	21.380
711.271	21.947
749.148	21.956
774.990	21.721
819.731	22.051
862.773	22.061
909.258	22.071
945.402	22.239
974.682	22.085];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Graa2003';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'temperature (C) in tL data is assumed to vary as T(t)=20+10*sin(2*pi(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00407*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6R4DW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '218296'; % Ency of Life
metaData.links.id_Wiki = 'Macrognathus_pancalus'; % Wikipedia
metaData.links.id_ADW = 'Macrognathus_pancalus'; % ADW
metaData.links.id_Taxo = '179449'; % Taxonomicon
metaData.links.id_WoRMS = '281481'; % WoRMS
metaData.links.id_fishbase = 'Macrognathus-pancalus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrognathus_pancalus}}';
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
bibkey = 'Graa2003'; type = 'article'; bib = [ ... 
'doi = {10.1046/j.1365-2400.2003.00341.x}, ' ...
'author = {G. de Graaf}, ' ...
'year = {2003}, ' ...
'title = {The ﬂood pulse and growth of ﬂoodplain ﬁsh in {B}angladesh}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {10}, '...
'pages = {241–247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoraSona2020'; type = 'article'; bib = [ ... 
'author = {Rimle Borah and Jyotirmoy Sonowa and Nipen Nayak and Akash Kachari and Shyama Prasad Biswas}, ' ...
'year = {2020}, ' ...
'title = {Induced breeding, embryonic and larval development of \emph{Macrognathus pancalus} ({H}amilton, 1822) under captive condition}, ' ... 
'journal = {Int. J. Aquat. Biol.}, ' ...
'volume = {8(1)}, '...
'pages = {73-82}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Macrognathus-pancalus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

