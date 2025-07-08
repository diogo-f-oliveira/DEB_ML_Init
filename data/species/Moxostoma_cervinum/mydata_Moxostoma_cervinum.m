  function [data, auxData, metaData, txtData, weights] = mydata_Moxostoma_cervinum

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Moxostoma_cervinum'; 
metaData.species_en = 'Blacktip jumprock'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 28]; 

%% set data
% zero-variate data
data.am = 2500;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'ThomBent2015';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'ThomBent2015'; 
  comment.Lp = ' based on SL 9.33 cm and F2';
data.Li = 19;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 1.9e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ThomBent2015';
  comment.Wwb = 'based on egg diameter of 1.54 mm : pi/6*0.154^3';
data.Wwp = 8.3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','ThomBent2015'};
  comment.Wwp = 'based on 0.00490*Lp^3.10, see F1';
data.Wwi = 45.1; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.10, see F1';

data.Ri = 15441/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'ThomBent2015';
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Moxostoma valenciennesi ';

% univariate data

% time-length
data.tL = [ ... % year class (yr), std length (cm)
82.420	4.460
118.953	5.608
150.790	5.707
150.848	5.609
151.216	4.986
155.448	6.822
155.893	6.068
183.189	4.855
183.247	4.757
183.634	4.101
188.640	4.625
241.431	5.249
247.250	4.397
247.618	3.774
273.191	5.479
289.022	5.676
299.809	5.414
309.937	6.266
310.324	5.611
315.059	6.594
315.388	6.037
315.485	5.873
330.755	7.021
331.259	6.168
335.199	8.496
335.258	8.398
336.226	6.759
341.174	7.382
341.251	7.250
346.238	7.808
352.328	6.497
362.166	7.841
362.515	7.251
363.793	5.087
367.346	8.071
369.418	4.562
372.410	8.497
374.328	5.251
377.804	8.366
387.971	9.153
388.068	8.989
388.707	7.907
393.790	8.300
394.216	7.579
399.726	7.251
420.621	7.875
425.492	8.629
429.936	10.104
430.052	9.907
435.678	9.383
451.412	9.744
451.529	9.547
477.372	10.793
482.882	10.466
483.056	10.170
483.172	9.974
483.463	9.482
489.205	8.761
489.340	8.531
493.939	9.744
504.978	9.056
514.370	11.154
514.990	10.105
519.996	10.630
521.080	8.794
637.100	10.369
642.609	10.041
642.764	9.779
642.880	9.582
663.389	10.861
668.995	10.370
679.956	9.812
711.754	9.977
721.824	10.928
722.618	9.583
722.715	9.420
738.140	10.305
741.945	12.862
742.623	11.715
742.797	11.420
748.868	10.141
752.887	12.338
753.623	11.092
768.602	12.732
768.989	12.076
779.524	12.240
784.433	12.929
785.014	11.945
785.460	11.191
801.059	11.781
811.264	12.503
811.516	12.076
817.258	11.355
821.683	12.863
907.240	12.012
907.686	11.258
912.053	12.865
912.208	12.602
940.665	9.422
965.134	12.997
965.289	12.734
998.114	11.161
1061.613	11.654
1099.018	11.326
1149.679	15.556
1156.679	12.704
1171.852	14.016
1171.968	13.819
1277.860	14.542
1277.995	14.312
1278.092	14.148
1367.629	15.559
1439.214	11.364
1454.038	13.265
1489.739	15.823
1558.864	15.791
1606.494	16.153
1624.378	12.874
1638.564	15.858
1638.951	15.202
1639.551	14.186
1639.803	13.760
1645.390	13.301
2010.480	16.191
2038.454	13.831
2138.623	15.242];
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ThomBent2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 * (TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85 * TL'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '44GTX'; % Cat of Life
metaData.links.id_ITIS = '163937'; % ITIS
metaData.links.id_EoL = '204286'; % Ency of Life
metaData.links.id_Wiki = 'Moxostoma_cervinum'; % Wikipedia
metaData.links.id_ADW = 'Moxostoma_cervinum'; % ADW
metaData.links.id_Taxo = '180406'; % Taxonomicon
metaData.links.id_WoRMS = '1214764'; % WoRMS
metaData.links.id_fishbase = 'Moxostoma-cervinum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Moxostoma_cervinum}}';  
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
bibkey = 'ThomBent2015'; type = 'Article'; bib = [ ...  
'author = {Dezarai A. Thompson and John S. Bentley and Steven L. Powers}, ' ...
'year = {2015}, ' ...
'title = {Life-history Aspects of \emph{Moxostoma cervinum} (Blacktip Jumprock) in the {R}oanoke River, {V}irginia}, ' ... 
'journal = {Virginia Journal of Science}, ' ...
'volume = {66(4)}, '...
'pages = {391-401}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Moxostoma-cervinum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

