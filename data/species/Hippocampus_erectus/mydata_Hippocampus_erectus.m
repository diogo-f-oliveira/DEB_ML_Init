function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_erectus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_erectus'; 
metaData.species_en = 'Lined seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 17];

%% set data
% zero-variate data

data.ab = 20.1;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Matl1992';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'fishbase gives 1 yr';

data.Lb  = 1.8;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'Matl1992'; 
  comment.Lb = 'based on tL data';
data.Lp  = 6.3;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 19;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 0.026; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = {'fishbase','Matl1992'};
  comment.Wwb = 'based on 0.00447*Lb^3.00, see F1';
data.Wwp = 1.12;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00444*Lp^3.00, see F1';
data.Wwi = 30.6;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.00, see F1';

data.Ri  = 466/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'LinLi2012';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ...
3.361	2.014
72.269	5.529
272.269	4.630
317.647	6.867
317.648	4.693
344.538	5.683
346.218	6.578
351.261	5.939
361.345	8.272
364.706	7.057
368.067	5.491
374.790	4.883
376.471	6.194
379.832	6.609
388.235	7.984
423.529	5.170
440.336	8.271
447.059	6.928
450.420	4.274
453.782	8.398
484.034	7.246
490.756	7.662
492.437	6.479
492.437	5.328
510.924	7.566
515.966	11.018
515.966	5.839
517.647	9.036
517.648	7.374
536.134	9.100
552.941	8.396
557.983	10.474
557.984	5.582
561.345	8.619
563.025	8.044
566.387	7.340
568.067	9.003
571.429	8.811
573.108	7.436
573.109	7.276
573.110	6.669
574.790	8.076
574.791	7.724
579.832	7.532
581.513	8.555
584.874	9.035
584.875	8.331
591.597	9.482
591.597	5.709
593.277	7.947
593.278	7.308
594.958	7.787
596.639	8.555
598.319	6.029
606.723	8.970
608.403	7.723
610.084	7.339
611.765	8.490
615.126	6.796
616.807	10.153
616.808	7.723
616.809	8.011
623.529	10.089
623.530	7.915
623.531	7.371
625.210	8.298
635.294	11.080
635.295	8.234
638.655	8.650
638.656	6.763
642.017	9.641
647.058	11.079
647.059	9.289
647.059	6.923
648.740	10.568
652.101	8.617
652.102	8.170
653.782	11.399
653.783	9.417
657.143	9.544
663.866	10.759
663.867	9.896
663.868	7.786
667.227	8.074
668.908	10.280
678.992	8.489
678.993	8.329
678.994	9.224
684.034	10.983
684.035	9.032
685.714	12.421
685.714	8.936
687.395	10.119
687.395	9.576
694.118	9.224
697.479	8.297
699.160	11.462
699.160	11.174
700.840	11.973
700.840	11.654
700.840	10.215
700.840	8.201
709.244	8.424
710.924	11.493
714.286	10.566
722.689	10.246
724.370	12.388
727.731	10.406
751.261	9.159
754.622	10.246
764.706	10.086
778.151	8.455
791.597	13.026
793.277	11.651
793.277	13.474
793.277	10.021
794.958	11.460
867.227	11.522
1052.101	12.509
1063.866	14.651
1063.866	12.509
1068.908	13.563
1282.353	16.020];
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Matl1992';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LZLD'; % Cat of Life
metaData.links.id_ITIS = '166488'; % ITIS166493
metaData.links.id_EoL = '46567770'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_erectus'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_erectus'; % ADW
metaData.links.id_Taxo = '176692'; % Taxonomicon
metaData.links.id_WoRMS = '159445'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-erectus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_erectus}}';
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
bibkey = 'Matl1992'; type = 'Article'; bib = [ ... 
'author = {Matlock, G. C.}, ' ... 
'year = {1992}, ' ...
'title = {Life history aspects of seahorses, \emph{Hippocampus}, in {T}exas}, ' ...
'journal = {Texas J. Sci.}, ' ...
'volume = {44(2)}, ' ...
'pages = {213-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LinLi2012'; type = 'Article'; bib = [ ... 
'doi = {10.1242/bio.2012398}, ' ...
'author = {Qiang Lin and, Gang Li and Geng Qin and Junda Lin and Liangmin Huang and Hushan Sunand Peiyong Feng}, ' ... 
'year = {2012}, ' ...
'title = {The dynamics of reproductive rate, offspring survivorship and growth in the lined seahorse, \emph{Hippocampus erectus} {P}erry, 1810}, ' ...
'journal = {Biology Open}, ' ...
'volume = {1}, ' ...
'pages = {391–396}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus_erectus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

